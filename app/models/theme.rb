class Theme < ApplicationRecord
  has_many :codes

  validates :title, presence: true, uniqueness: true
end
