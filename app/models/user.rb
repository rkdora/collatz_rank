class User < ApplicationRecord
  has_secure_password
  has_many :codes

  validates :name, presence: true, uniqueness: true
end
