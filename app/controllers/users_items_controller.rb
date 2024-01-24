class UsersItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_record = PurchaseRecord.new
    render 'orders/index'
  end  

  def create
    @purchase_record = PurchaseRecord.new(users_items_params)
  
    if @purchase_record.valid?
      if @purchase_record.save
        pay_item
        redirect_to root_path
      else
        # 保存に失敗した場合の処理
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render 'orders/index', status: :unprocessable_entity
      end
    else
      # バリデーションに失敗した場合の処理
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'orders/index', status: :unprocessable_entity
    end  
  end
  
  private
  def users_items_params
    params.require(:purchase_record).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: users_items_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.user_item.present?
  end
end
