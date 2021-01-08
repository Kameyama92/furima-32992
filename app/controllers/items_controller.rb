class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render action: :edit
    end
  end


  private
  
  
  def item_params
    params.require(:item).permit(:image,:name,:expranation,:category_id,:price,:quality_id,:delivery_burden_id,:prefecture_id,:shipping_id).merge(user_id: current_user.id)
  end


  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end



