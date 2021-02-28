class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  
  def index
    @movie = Movie.find(params[:movie_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得
    redirect_to new_card_path and return unless card.present?
  
    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
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
      params.require(:buyer_order).permit(:postal_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number).merge(user_id: current_user.id,movie_id:params[:movie_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
      customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
      Payjp::Charge.create(
        amount: @movie.price, # 商品の値段
        customer: customer_token, # 顧客のトークン
        currency: 'jpy' # 通貨の種類（日本円）
        )
    end