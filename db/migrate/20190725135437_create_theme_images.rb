class CreateThemeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_images do |t|
      t.references :theme, foreign_key: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
