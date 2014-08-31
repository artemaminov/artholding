class AddGroupToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :group, index: true
  end
end
