class Client < ActiveRecord::Base

  has_many :projects
  has_attached_file :logo, :styles => { client_logo: "266x175>" }

  validates :name, :logo, presence: true
  validates_attachment :logo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }




end
