class ChangeTaskStartColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :start, :day
  end
end
