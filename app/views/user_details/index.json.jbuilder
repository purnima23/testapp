json.array!(@user_details) do |user_detail|
  json.extract! user_detail, :id, :name, :address, :gpscoordinate, :user_id
  json.url user_detail_url(user_detail, format: :json)
end
