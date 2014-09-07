class AddAttachmentCarouselMainToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :carousel
      t.attachment :main
    end
  end

  def self.down
    remove_attachment :projects, :carousel
    remove_attachment :projects, :main
  end
end
