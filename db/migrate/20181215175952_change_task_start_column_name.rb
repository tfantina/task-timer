class ChangeTaskStartColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :Tasks, :start, :day
  end
end
