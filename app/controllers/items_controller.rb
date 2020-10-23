class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.image.attached?
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
