class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :comments,dependent: :destroy

  with_options presence: true do
    validates :title
    validates :explanation
    validates :video
    validates :price
  end
end
