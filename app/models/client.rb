class Client < ActiveRecord::Base

  has_many :projects
  has_attached_file :logo
  has_attached_file :logo_grey

  validates :name, :logo, :logo_grey, presence: true
  validates_attachment :logo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :logo_grey, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
