class User < ApplicationRecord
  has_secure_password

  validates :name, :birth_date, :url, presence: true
  validates :email, presence: true, uniqueness: true
  validates :bio, length: { maximum: 180 }

  has_many :posts
  has_many :followers, class_name: 'Follower', foreign_key: :user_id
  has_many :users_followed, class_name: 'Follower', foreign_key: :follower_id
  has_many :notifications

  has_one_attached :avatar

  def is_following? user_i_follow_id
    users_followed.exists? user_id: user_i_follow_id
  end

  def can_follow? user_to_follow_id
    id != user_to_follow_id.to_i
  end

  def can_edit? user_to_follow_id
    id == user_to_follow_id.to_i
  end

  def number_notifications_uread
    notifications.unread.count
  end

end
