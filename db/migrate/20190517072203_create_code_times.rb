class CreateCodeTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :code_times do |t|
      t.references :code, foreign_key: true
      t.string :time

      t.timestamps
    end
  end
end
