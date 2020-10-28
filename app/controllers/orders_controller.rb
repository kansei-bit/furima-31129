class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_the_item, only: [:index, :create]
  before_action :show_toppage, only: :index
  def index
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def find_the_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:item_id, :token, :zip_code, :prefecture_id, :city, :town, :apartment_number, :tel).merge(user_id: @item.user.id)
  end

  def show_toppage
    return redirect_to root_path unless @item.order.blank?
    return redirect_to root_path if @item.user_id == current_user.id
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
