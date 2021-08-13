class BuysController < ApplicationController
  before_action :set_buy, only:[:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_buy
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:post_number, :ship_area_id, :address_city, :address_no, :address_build, :tele_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def pay_buy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.money,
      card: buy_params[:token],
      currency: 'jpy'
    )
end

end
