class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :phonenumb
      t.references :order_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
