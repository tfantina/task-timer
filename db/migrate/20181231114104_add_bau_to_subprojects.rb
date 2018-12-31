class AddBauToSubprojects < ActiveRecord::Migration[5.0]
  def change
    add_column :subprojects, :bau, :boolean
  end
end
