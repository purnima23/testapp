class RemoveGpscoordinateFromUserDetails < ActiveRecord::Migration
  def change
    remove_column :user_details, :gpscoordinate, :string
  end
end
