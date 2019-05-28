class User < ApplicationRecord
  has_secure_password
  has_many :codes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
