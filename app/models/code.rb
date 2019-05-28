class Code < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_one :code_time, dependent: :destroy

  validates :content, presence: true
end
