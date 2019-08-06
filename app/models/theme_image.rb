class ThemeImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :theme
  validate :unique_name

  def unique_name
    errors.add(:image, 'has already been taken') if Dir.open("public/uploads/theme_images/",&:to_a).include?(image.to_s.reverse.sub!(/\/.*/, "").reverse)
  end
end
