class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  
  def index
    @movie = Movie.find(params[:movie_id])
    if @movie.user_id == current_user.id 
      redirect_to root_path   
    else
      @order = BuyerOrder.new
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @order = BuyerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index  
    end
  end
end

private

    def order_params
      params.require(:buyer_order).permit(:postal_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number).merge(user_id: current_user.id,movie_id:params[:movie_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    end