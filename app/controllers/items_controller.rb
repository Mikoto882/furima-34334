class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :item_status_id, :delivery_cover_id, :ship_area_id, :ship_day_id, :category_id, :money).merge(user_id: current_user.id)
  end
end
