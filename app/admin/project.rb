ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :title, :about, :finished_at, :image, :group_id, :client_id, :is_in_carousel

  jcropable

  index do
    column :title do |project|
      link_to project.title, edit_admin_project_path(project)
    end
    column :finished_at
    column :group do |project|
      project.group.name
    end
    column :client
    column :image do |project|
      image_tag project.image.url :small, width: "266px"
    end
    actions
  end

  form do |f|
    f.inputs "Проект" do
      f.input :group
      f.input :title
      f.input :about, input_html: {rows: 5}
      f.input :image, as: :jcropable, jcrop_options: { aspectRatio: 1.52, minSize: [702, 416] }
      f.input :finished_at
      f.input :client
      f.input :is_in_carousel
    end
    f.actions
  end


end
