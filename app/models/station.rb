class Station < ApplicationRecord
  has_many :posts, dependent: :destroy
end