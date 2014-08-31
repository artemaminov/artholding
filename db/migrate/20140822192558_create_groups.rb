class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, limit: 12
      t.integer :sorting_position

      t.timestamps
    end
  end
end
