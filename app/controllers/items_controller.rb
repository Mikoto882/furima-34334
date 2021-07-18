class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
