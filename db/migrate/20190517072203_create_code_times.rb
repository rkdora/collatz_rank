class CreateCodeTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :code_times do |t|
      t.references :code, foreign_key: true, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
