class RemoveDayFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :day, :datetime
  end
end
