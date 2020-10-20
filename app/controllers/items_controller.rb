class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)
  end

  private
  def items_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end