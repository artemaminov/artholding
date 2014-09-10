ActiveAdmin.register Project do

  menu priority: 2

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

  permit_params :title, :about, :finished_at, :preview, :carousel, :main, :group_id, :client_id, :is_in_carousel, :swf_width, :swf_height

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
      image_tag project.preview.url :small, width: "266px"
    end
    actions
  end

  form do |f|
    f.inputs "Проект" do
      f.input :group
      f.input :title
      f.input :about, input_html: {rows: 5}
      f.input :finished_at
      f.input :client
    end
    f.inputs "Изображения" do
      f.input :main, input_html: {
          :onchange => "if ($(this).val().split('.').pop().toLowerCase() == 'swf') {$('.swf-fields').parent().show();} else {$('.swf-fields').parent().hide(); $('.swf-fields').val(null);}"
      }
      f.input :preview
      f.input :carousel
      f.input :swf_width, input_html: { class: "swf-fields" }
      f.input :swf_height, input_html: { class: "swf-fields" }
    end
    f.inputs "Настройки" do
      f.input :is_in_carousel
    end
    f.actions
  end


end
