class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :issue, index: true
      t.references :project, index: true
      t.string :description
    end
  end
end
