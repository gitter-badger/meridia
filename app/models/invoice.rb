class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :date_service, type: Date
  field :date_create, type: Date
  field :description, type: String
  field :status, type: Integer, default: 0
  field :total, type: Integer, default: 0 

  belongs_to :member
  #belongs_to :additional_service
  has_many :additional_service
  embeds_many :list_services
  embeds_many :payments
  scope :active, -> { where(status: 1) }
  scope :open,  -> {where(status: 0)}
  scope :cloused, -> {where(status: 2)}
  #accepts_nested_attributes_for :list_services

  STATUS=['Actual','Pendiente de Pago', 'Pagado']

  def status_change(status)
    case status
      when 1
        total = 0
        aditional = 0
        aditional = self.list_services.sum("price")        
        total = aditional + self.member.monthly_payment
        self.update_attributes(total: total, status: 1)
    end
  end

end
