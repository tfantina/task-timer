class CreateProjectAssocaitions < ActiveRecord::Migration[5.0]
  def change
    create_table :project_assocaitions do |t|
      t.references :project, foreign_key: true
      t.references :subproject, foreign_key: true

      t.timestamps
    end
  end
end
