class AddOutPutToCodeTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :code_times, :out_put, :text
  end
end
