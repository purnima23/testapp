class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :address
      t.string :gpscoordinate
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
