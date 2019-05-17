class Code < ApplicationRecord
  belongs_to :user
  has_one :code_time

  validates :content, presence: true
end
