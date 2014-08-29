json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :date, :description
  json.url invoice_url(invoice, format: :json)
end
