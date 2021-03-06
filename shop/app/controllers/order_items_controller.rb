class OrderItemsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new
    @order_item.good_id = params[:good_id]
    @item = Good.find(@order_item.good_id)
    @order = Order.new(is_good: true)
  end

  def show
  end

  def update
  end

  def edit
  end

  def create
    @order = Order.new(order_state_id: 1, is_good: true)
    @order.save
    @order_item = current_user.order_items.create(order_item_params)
    @order_item = @order.order_items.create(order_item_params)
    if @order_item.save 
      redirect_to edit_order_path(@order.id, :send_way_id => params[:order_item][:order][:send_way_id])
    else
      @good = Good.find(params[:order_item][:good_id])
      flash[:warning] = "Należy podać poprawną ilosć produktów" 
      redirect_to new_order_item_path(:good_id => params[:order_item][:good_id], :how_many => params[:order_item][:how_many])
    end
  end

  def destroy
  end
  
  
  private
      def order_item_params
        params.require(:order_item).permit(:good_id, :how_many, order_attributes: [:send_way_id])
      end
  
      def order_params
        params.require(:order).permit(:send_way_id)
      end
end
