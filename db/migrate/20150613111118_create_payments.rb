class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_security_code
      t.decimal :amount
      t.decimal :amount
      t.boolean :success
      t.string :authorization_code

      t.timestamps null: false
    end
  end
end
