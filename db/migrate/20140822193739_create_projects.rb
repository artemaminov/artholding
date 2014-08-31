class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, limit: 30
      t.string :about
      t.date :finished_at
      t.string :site, limit: 30
      t.references :client, index: true

      t.timestamps
    end
  end
end
