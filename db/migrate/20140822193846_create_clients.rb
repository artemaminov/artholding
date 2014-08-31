class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, limit: 30
      t.string :site, limit: 30

      t.timestamps
    end
  end
end
