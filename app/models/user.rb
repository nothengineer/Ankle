class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    ZENNKAKU = /\A[ぁ-んァ-ン一-龥々]+\z/
    ZENNKAKU_KATAKANA = /\A[ァ-ヶー－]+\z/
    with_options presence: true do
    validates :nickname
    validates :familyname,format: { with: ZENNKAKU}
    validates :firstname,format: { with: ZENNKAKU }
    validates :familyname_kana,format: { with: ZENNKAKU_KATAKANA } 
    validates :firstname_kana,format: { with: ZENNKAKU_KATAKANA }
    validates :birthday
    validates :password,format: { with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    end
end
