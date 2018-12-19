class AddDayToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :day, :date
  end
end
