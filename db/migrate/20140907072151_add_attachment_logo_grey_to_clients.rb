class AddAttachmentLogoGreyToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.attachment :logo_grey
    end
  end

  def self.down
    remove_attachment :clients, :logo_grey
  end
end
