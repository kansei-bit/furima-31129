class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @delivery_charge = DeliveryCharge.find(id = @item.delivery_charge_id)
    @category = Category.find(id = @item.category_id)
    @status = Status.find(id = @item.status_id)
    @prefecture = Prefecture.find(id = @item.prefecture_id)
    @shipping_date = ShippingDate.find(id = @item.shipping_date_id)
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
