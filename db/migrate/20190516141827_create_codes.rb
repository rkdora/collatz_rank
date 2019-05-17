class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.references :user, foreign_key: true, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
