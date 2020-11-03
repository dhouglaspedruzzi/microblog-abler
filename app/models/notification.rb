class Notification < ApplicationRecord
  belongs_to :user

  validates :message, :user_id, presence: true
  validates :message, length: { maximum: 255 }

  scope :unread, -> { where read: false }
end
