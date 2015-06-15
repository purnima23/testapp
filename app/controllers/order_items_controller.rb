class OrderItemsController < ApplicationController
  def create
  	@order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
  	@order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

    
  end

  def destroy
  	@order = current_order
    @order_item = @order.order_items.find(params[:id])
    
    @order_items = @order.order_items

      @order_item.destroy
      respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
