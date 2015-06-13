class CartsController < ApplicationController
  def show
  	@order_irems = current_order.order_items
  end
end
