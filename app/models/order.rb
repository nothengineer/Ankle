class Order < ApplicationRecord
  has_one :address   
  belongs_to :user    
  belongs_to :movie

  with_options presence: true do
    validates :user_id
    validates :movie_id
    validates :postal_code,format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipalities,format:{with:/\A[一-龥ぁ-ん]/}
    validates :address
    validates :phone_number,format:{with:/\A\d{11}\z/}
  end
end
