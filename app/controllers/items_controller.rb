class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :pull_item_params, except: [:index, :new, :create]
  before_action :root_redirect, except: [:index, :new, :create, :show]
  before_action :root_redirect_done, except: [:index, :new, :create, :show, :destroy]

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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :condition_id, :burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def pull_item_params
    @item = Item.find(params[:id])
  end

  def root_redirect
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def root_redirect_done
    redirect_to root_path if current_user.id == (@item.user_id) && !@item.buy.nil?
  end
end
