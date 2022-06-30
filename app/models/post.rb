class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :station
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end