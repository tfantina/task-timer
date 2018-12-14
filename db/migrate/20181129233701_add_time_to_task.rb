class AddTimeToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :time, :integer
  end
end
