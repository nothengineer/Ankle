class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(params[:id])
      @movie = @user.movies.order(id: "DESC")
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      card = Card.find_by(user_id: current_user.id)
      if card.present?
        customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
        @card = customer.cards.first
      end
    end
    redirect_to root_path
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
