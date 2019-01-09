class AddPrecentageCompleteToProjects < ActiveRecord::Migration[5.0]
  def change
    change_table :projects do |t|
      t.decimal :precentage_complete
      t.string :summary
      t.date :go_live
    end
  end
end
