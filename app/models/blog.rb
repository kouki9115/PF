class Blog < ApplicationRecord
  attachment :image
  attachment :profile_image

  belongs_to :genre

  belongs_to :user

  has_many:blog_comments, dependent: :destroy
  has_many:favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
