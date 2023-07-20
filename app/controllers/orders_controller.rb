class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
  end

  def create
    binding.pry
    @order_form = OrderForm.new(order_params)
    if @order_form.save
      # 保存が成功した場合の処理
      # 例: ユーザーに購入完了のメッセージを表示し、トップページにリダイレクトする
      flash[:success] = "Purchase completed successfully!"
      redirect_to root_path
    else
      # 保存が失敗した場合の処理
      # 例: 入力エラーのメッセージを表示し、購入画面にリダイレクトする
      flash[:error] = "Failed to complete purchase. Please check your input."
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id)
  end
end
