class Blog < ApplicationRecord
  attachment :image # destroy: false
  attachment :profile_image, destroy: false

  belongs_to :genre

  belongs_to :user

  has_many:blog_comments, dependent: :destroy
  has_many:favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
