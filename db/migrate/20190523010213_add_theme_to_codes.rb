class AddThemeToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :theme_id, :integer
  end
end
