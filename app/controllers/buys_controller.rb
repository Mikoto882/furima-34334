class BuysController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:post_number, :ship_area_id, :address_city, :address_no, :address_build, :tele_number, :item_id).merge(user_id: current_user.id)
  end

end
