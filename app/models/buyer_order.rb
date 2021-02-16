class BuyerOrder
  include ActiveModel::Model
  attr_accessor :user_id,:movie_id,:postal_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number,:token
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :movie_id
    validates :postal_code,format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipalities,format:{with:/\A[一-龥ぁ-ん]/}
    validates :address
    validates :phone_number,format:{with:/\A\d{11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id,movie_id: movie_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,municipalities: municipalities,address:address, building_name:building_name,phone_number: phone_number,order_id: order.id)
  end
end