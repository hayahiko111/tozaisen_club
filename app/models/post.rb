class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :station
  has_one_attached :image
end