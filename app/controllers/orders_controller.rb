class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_public_key, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  
  def index
    @order_form = OrderForm.new
    # ログイン状態で出品者が自身が出品した商品の注文ページに遷移しようとするか、自身が出品していない売却済み商品の注文ページに遷移しようとする場合は、トップページに遷移する
    if (@item.user == current_user) || (@item.order && @item.user != current_user)
      redirect_to root_path
      return
    end
  end

  def create
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
    params.require(:order_form).permit(:postal_code, :prefecture, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
