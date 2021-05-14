class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :pull_item_params, except: [:index, :new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :condition_id, :burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def pull_item_params
    @item = Item.find(params[:id])
  end
end
