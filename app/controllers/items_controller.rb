class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
