class ChangeDataTypeForProjectAbout < ActiveRecord::Migration
  def change
    change_column :projects, :about, :text
  end
end
