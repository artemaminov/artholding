class Project < ActiveRecord::Base

  belongs_to :client
  belongs_to :group
  has_attached_file :image, :styles => { small: "266x175#", medium: "702x416#", carousel: "1600x350#" }

  validates :title, :about, :finished_at, :group_id, :image, presence: true
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.carouselled
    where is_in_carousel: true
  end

  def self.of_group group_id
    where group_id: group_id
  end

  def next(group)
    next_project = Project.where(["id > :id", id: self.id])
    next_project = next_project.of_group(self.group.id) if group == 'true'
    next_project = next_project.order(id: :asc).first

    return nil if next_project.blank? || next_project.id < self.id

    next_project
  end

  def prev(group)
    prev_project = Project.where(["id < :id", id: self.id])
    prev_project = prev_project.of_group(self.group.id) if group == 'true'
    prev_project = prev_project.order(id: :desc).first

    return nil if prev_project.blank? || prev_project.id > self.id

    prev_project
  end

end
