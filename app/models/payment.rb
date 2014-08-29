class Payment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :price, type: Integer
  field :description, type: String
  field :created_at, type: Date, default: Time.now
  field :type
  
  embedded_in :invoice

  validates_presence_of :price

  before_save :invoice_status

  def invoice_status
    invoice = self.invoice
    total = invoice.payments.sum("price")
    #invoice.update_attributes(status:2)
  end

end
