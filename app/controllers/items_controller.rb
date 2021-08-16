class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:new, :create, :index, :show]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :item_status_id, :delivery_cover_id, :ship_area_id, :ship_day_id, :category_id, :money).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id != @item.user_id || @item.buy == nil
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
