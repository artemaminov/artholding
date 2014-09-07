class AddAttachmentPreviewToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :preview
    end
    remove_attachment :projects, :image
  end

  def self.down
    remove_attachment :projects, :preview
  end
end
