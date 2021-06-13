class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :pull_item_params
  before_action :root_redirect_done

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      buy_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def buy_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def pull_item_params
    @item = Item.find(params[:item_id])
  end

  def root_redirect_done
    redirect_to root_path if current_user.id == (@item.user_id) || !@item.buy.nil?
  end
end
