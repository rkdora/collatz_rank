class AddUptimeToCodeTime < ActiveRecord::Migration[5.2]
  def change
    add_column :code_times, :uptime, :float
  end
end
