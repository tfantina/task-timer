class AddSubprojectToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :subproject, foreign_key: true
  end
end
