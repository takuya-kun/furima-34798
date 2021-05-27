class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.new(buy_params)
    if @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
