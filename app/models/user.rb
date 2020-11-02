class User < ApplicationRecord
  has_secure_password

  validates :name, :birth_date, presence: true
  validates :email, presence: true, uniqueness: true

  before_validation :build_url

  def build_url
    return if url?
    new_url = name.gsub(/\s+/, '').underscore
    count = User.select(:id).where(url: new_url).count
    self.url = "#{ new_url }#{ "_#{ count }" if count.positive? }"
  end
end
