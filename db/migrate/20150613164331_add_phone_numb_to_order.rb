class AddPhoneNumbToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :phonenumb, :string
  end
end
