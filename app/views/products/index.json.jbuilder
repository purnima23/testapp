json.array!(@products) do |product|
  json.extract! product, :id, :name, :days_before_expired, :quantity, :user_id
  json.url product_url(product, format: :json)
end
