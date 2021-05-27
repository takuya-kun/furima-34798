class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.new(buy_params)
    if @buy.valid?
      buy_item
      @buy.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def buy_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
