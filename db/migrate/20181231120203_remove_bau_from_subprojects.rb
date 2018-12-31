class RemoveBauFromSubprojects < ActiveRecord::Migration[5.0]
  def change
    remove_column :subprojects, :bau, :boolean
  end
end
