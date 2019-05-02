class RemoveTeamIdIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :team_id_id
  end
end
