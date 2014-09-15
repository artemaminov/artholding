class AddPositionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :position, :integer
    add_column :projects, :group_position, :integer
  end
end
