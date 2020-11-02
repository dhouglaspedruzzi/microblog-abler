class User < ApplicationRecord
  has_secure_password

  validates :name, :birth_date, presence: true
  validates :email, presence: true, uniqueness: true
end
