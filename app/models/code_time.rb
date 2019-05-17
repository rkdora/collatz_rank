class CodeTime < ApplicationRecord
  belongs_to :code

  validates :time, presence: true
end
