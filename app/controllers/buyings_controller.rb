class BuyingsController < ApplicationController
  before_action :authenticate_user!
  before_action :finding, only: [:index, :create]

  def index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.buying.present? 
      redirect_to root_path
    end

    @buying = BuyingBuyer.new
  end

  def create
    @buying = BuyingBuyer.new(buying_params)
    if @buying.valid? && @buying.save
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buying_params
    params.require(:buying_buyer).permit(:postal_code, :prefectures, :city, :address, :tel, :prefectures_id, :building_name, :item_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    item_params = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_eece27e6bb12a6fa6e534e41"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_params[:price],  # 商品の値段
      card: buying_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def finding
    @item = Item.find(params[:item_id])
  end

end