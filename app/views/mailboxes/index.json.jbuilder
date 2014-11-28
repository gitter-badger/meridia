json.array!(@mailboxes) do |mailbox|
  json.extract! mailbox, :id, :name
  json.url mailbox_url(mailbox, format: :json)
end
