class Theme < ApplicationRecord
  has_many :codes, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
