class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :days_before_expired
      t.integer :quantity
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
