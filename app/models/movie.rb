class Movie < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
  end
end
