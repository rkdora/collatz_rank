class RemoveNameFromThemeImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :theme_images, :name, :string
  end
end
