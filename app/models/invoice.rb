class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :date_service, type: Date
  field :date_create, type: Date
  field :description, type: String
  field :status, type: Integer, default: 0
  field :total, type: Integer, default: 0 
  field :inscription, type: Boolean, default: false
  belongs_to :member
  #belongs_to :additional_service
  has_many :additional_service
  embeds_many :list_services
  embeds_many :payments

  scope :active, -> { where(status: 1) }
  scope :open,  -> {where(status: 0)}
  scope :cloused, -> {where(status: 2)}
  accepts_nested_attributes_for :list_services

  STATUS=['Actual','Pendiente de Pago', 'Pagado']

  before_update :status_change
  
  def status_change
    case self.status
      when 1
        total = 0
        aditional = 0
        aditional = self.list_services.sum("price")        
        total = aditional + self.member.monthly_payment
        self.total= total
        self.status = 1
      end
  end

  def self.invoice_validate(member) 
    invoice = member.invoices.open.last 
    if invoice.nil? 
      invoice = first_invoice(member)
    end
    invoice
  end

  def self.first_invoice(member)
    if member.invoices.where(inscription: true).empty?
    invoice = Invoice.create(:description => "Primera Factura",inscription: true)
    inscripcion = ListService.new(date_service:Time.now, name: "Inscripcion", price: Mongoid::Multitenancy.current_tenant.inscription , description: "Inscripcion de participantes" )
    invoice.list_services << inscripcion
    else
      invoice = Invoice.create
    end
    member.invoices << invoice
    invoice
  end

  def self.get_start_end_date date_start,date_end
    where(:created_at.gte=>date_start, :created_at.lte =>date_end)
  end
  
end
