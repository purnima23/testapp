class UserDetail < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end
