json.array!(@order_item) do |product|
  json.extract! product, :id, :order_items, :product, :order, :unit_price
  json.url order_item_url(product, format: :json)
end
