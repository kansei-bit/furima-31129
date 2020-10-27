class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    unless @item.order.blank?
      redirect_to root_path
    end
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :zip_code, :prefecture_id, :city, :town, :apartment_number, :tel).merge(user_id: @item.user.id)
  end
end
