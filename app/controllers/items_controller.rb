class ItemsController < ApplicationController
  before_action :select_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:order).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
  end

  def edit
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    if @item.user == current_user && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    return redirect_to item_path(@item) if @item.update(item_params)

    render 'edit', status: :unprocessable_entity
  end

  def destroy
    return redirect_to root_path if @item.destroy

    render 'show', status: :unprocessable_entity
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :shipping_date_id,
      :prefecture_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end

  def redirect_to_show
    return redirect_to root_path if current_user.id != @item.user.id
  end
end
