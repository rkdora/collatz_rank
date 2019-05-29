class Code < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_one :code_time, dependent: :destroy

  validates :content, presence: true
  validate :prevent_invalid_code

  def prevent_invalid_code
    return if content.nil?

    errors.add(:content, 'is invalid.') unless content.include?('(time') && content.include?('#lang racket')
  end
end
