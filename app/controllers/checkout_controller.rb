class CheckoutController < ApplicationController
	def show
		
	end

	def new
		@customer = Checkout.new
		@order_items = current_order.order_items.all
	end

	def create
		@newcustomer = Checkout.new(params[:phonenumb])
		@customerdata =   @customer.current_order.order_items.all
	end

end
