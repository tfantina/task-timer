class CreateSubprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :subprojects do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
