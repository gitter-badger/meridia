namespace :invoice do
	task :invoice => :environment do
   def update_invoice
    invoices = Invoice.where(status: 0)
    invoices.each do |invoice| 
      add = invoice.status_change(1)
      member = invoice.member
      member.invoices.create!
    end
   end
  update_invoice 
  end
end
