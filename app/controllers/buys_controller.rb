class BuysController < ApplicationController

  def index
    
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :new
    end
  end

end
