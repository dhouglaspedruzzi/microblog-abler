class Follower < ApplicationRecord

  belongs_to :user, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  validates :user_id, :follower_id, presence: true

end