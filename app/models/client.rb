class Client < ActiveRecord::Base

  has_many :projects
  has_attached_file :logo, styles: { original: '170>' }
  has_attached_file :logo_grey, styles: { original: '170>' }

  validates :name, :logo, :logo_grey, presence: true
  validates_attachment :logo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :logo_grey, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
