class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @buy_delivery = BuyDelivery.new

    if @item.buy.present?
      redirect_to root_path
    end

    if current_user == @item.user
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @buy_delivery = BuyDelivery.new(delivery_params)
    
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end


  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def delivery_params
    params.require(:buy_delivery).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id] )
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:items_price],
      card: delivery_params[:token],
      currency: 'jpy'
    )
  end

end