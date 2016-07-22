json.array!(@bids) do |bid|
  json.extract! bid, :id, :price, :start_date, :end_date, :order_id, :user_id
  json.url bid_url(bid, format: :json)
end
