class RemoveProjectIdfromSubprojects < ActiveRecord::Migration[5.0]
  def change
    remove_column :Subprojects, :project_id
  end
end
