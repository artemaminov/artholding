class AddSwfFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :swf_width, :integer
    add_column :projects, :swf_height, :integer
  end
end
