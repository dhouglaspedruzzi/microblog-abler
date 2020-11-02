class Post < ApplicationRecord
  belongs_to :user

  validates :text, :user_id, presence: true
  validates :text, length: { maximum: 255 }
end
