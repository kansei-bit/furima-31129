class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_the_item, only: [:show, :edit, :update, :destroy]
  before_action :allow_only_owner, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def find_the_item
    @item = Item.find(params[:id])
  end

  def allow_only_owner
    redirect_to root_path if current_user != @item.user
  end
end
