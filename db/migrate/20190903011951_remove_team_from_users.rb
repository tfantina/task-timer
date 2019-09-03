class RemoveTeamFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :team
  end
end
