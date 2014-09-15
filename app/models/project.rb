class Project < ActiveRecord::Base

  belongs_to :client
  belongs_to :group
  has_attached_file :preview, :styles => { small: "266x175>#", medium: "702x416>#", swf_preview: "x400" }
  has_attached_file :carousel
  has_attached_file :main

  validates :title, :about, :finished_at, :group_id, :main, presence: true
  validates_attachment :preview, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :carousel, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :main, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/x-shockwave-flash"] }

  attr_accessor :next_one, :prev_one

  SWF_DROP = "and swf_width ISNULL"

  scope :carouselled, -> { where is_in_carousel: true }
  scope :of_group, ->(group_id) { where group_id: group_id }
  scope :recent, ->(amount) { limit amount }

  def self.find_neighbours id, group, zoom
    project = self.find id
    project.next_one = project.next_project group, zoom
    project.prev_one = project.prev_project group, zoom
    project
  end

  def prev_project group, zoom
    next_project = Project.where(["id > :id #{SWF_DROP if zoom}", id: self.id])
    next_project = next_project.of_group(self.group.id) if group == 'true'
    next_project = next_project.order(id: :asc).first

    return nil if next_project.blank? || next_project.id < self.id
    next_project
  end

  def next_project group, zoom
    prev_project = Project.where(["id < :id #{SWF_DROP if zoom}", id: self.id])
    prev_project = prev_project.of_group(self.group.id) if group == 'true'
    prev_project = prev_project.order(id: :desc).first

    return nil if prev_project.blank? || prev_project.id > self.id
    prev_project
  end

end
