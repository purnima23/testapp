# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

    @user = User.new(email: "user@user.com", password: "password")
    @user.save!
    
    @user.user_detail = UserDetail.new(name: "User", latitude: rand(3.000000000...3.100000000), longitude: rand(101.000000000...102.000000000)) 
    @user.user_detail.save!

# ## 30 Users
  30.times do 
    user = User.new(email: Faker::Internet.free_email, password: "password")
    user.save!
    user.user_detail = UserDetail.new(name: Faker::Name.name, latitude: rand(3.000000000...3.100000000), longitude: rand(101.000000000...102.000000000)) 
    user.user_detail.save!
  end

  @user.products << Product.create!(name:"Japanese Cucumber", days_before_expired: 7, quantity: 3, price: 0.49, active: true)
  @user.products <<  Product.create!(name:"Red Gala Apple", days_before_expired: 2, quantity: 4, price: 0.89, active: true)
  @user.products <<  Product.create!(name: "HL Chocolate Milk", days_before_expired: 6, quantity: 7, price: 2.59, active: true)
  @user.products <<  Product.create!(name:"Post Banana Nut Crunch Cereal", days_before_expired: 4, quantity: 3, price: 7.49, active: true)
  @user.products <<  Product.create!(name:"Nutella Jumbo Size", days_before_expired: 6, quantity: 3, price: 1.49, active: true)
  
  @users = User.where.not(id: 1)

  @users.each do |user|
    user.products << Product.create!(name: Faker::Commerce.department(2), days_before_expired: rand(1..10), quantity: rand(1..8), price: Faker::Commerce.price, active: true) 
    user.products << Product.create!(name: Faker::Commerce.department(2), days_before_expired: rand(1..10), quantity: rand(1..8), price: Faker::Commerce.price, active: true) 
    user.products << Product.create!(name: Faker::Commerce.department(2), days_before_expired: rand(1..10), quantity: rand(1..8), price: Faker::Commerce.price, active: true) 
    user.products << Product.create!(name: Faker::Commerce.department(2), days_before_expired: rand(1..10), quantity: rand(1..8), price: Faker::Commerce.price, active: true) 
    user.products << Product.create!(name: Faker::Commerce.department(2), days_before_expired: rand(1..10), quantity: rand(1..8), price: Faker::Commerce.price, active: true) 
  end

  OrderStatus.delete_all
	OrderStatus.create!(id: 1, name: "In Progress")
	OrderStatus.create!(id: 2, name: "Placed")
	OrderStatus.create!(id: 3, name: "Cancelled")

	# Product.create! name: "Banana", price: 0.49, active: true
	# Product.create!true name: "Apple", price: 0.29, active: true
	# Product.create! name: "Carton of Strawberries", price: 1.99, active: 