ActiveAdmin.register Client do


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

  permit_params :name, :site, :logo

  index do
    column :name
    column :site
    column :logo do |logo|
      image_tag logo.image.url :client_logo
    end
  end

  form do |f|
    f.inputs "Клиент" do
      f.input :name
      f.input :site
      f.input :logo
    end
    f.actions
  end


end
