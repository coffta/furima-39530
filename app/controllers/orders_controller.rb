class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      # エラーメッセージをログに出力
      Rails.logger.error(@order_form.errors.full_messages)
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture, :city, :block, :building, :phone_numbers).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
