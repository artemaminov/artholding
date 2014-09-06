class Client < ActiveRecord::Base

  has_many :projects
  has_attached_file :logo,
                    :styles => { client_logo: "266x150>", client_logo_grey: "266x150>" },
                    :convert_options => { :client_logo_grey => "-modulate 200,0 +level 60%,90% -background '#F5F5F5' -flatten" }

  validates :name, :logo, presence: true
  validates_attachment :logo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
