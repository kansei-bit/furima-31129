class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path unless @item.order.blank?
    return redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :zip_code, :prefecture_id, :city, :town, :apartment_number, :tel).merge(user_id: @item.user.id)
  end
end
