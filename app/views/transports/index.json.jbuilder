json.array!(@transports) do |transport|
  json.extract! transport, :id, :name, :body_type, :capacity
  json.url transport_url(transport, format: :json)
end
