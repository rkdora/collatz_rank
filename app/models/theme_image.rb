class ThemeImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :theme
end
