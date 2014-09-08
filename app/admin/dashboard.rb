ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Добро пожаловать в административную панель, Степан! :)"
        small "Управлять сайтом проще простого. Если что звони, Артем :)"
      end
    end

    columns do
      column do
        panel "Последние опубликованные проекты" do
          ul do
            Project.recent(5).map do |project|
              li link_to(project.title, admin_project_path(project))
            end
          end
        end
      end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end # content
end
