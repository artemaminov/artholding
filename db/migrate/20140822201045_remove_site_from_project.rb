class RemoveSiteFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :site, :string, limit: 30
  end
end
