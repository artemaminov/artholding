class AddIsInCarouselToProject < ActiveRecord::Migration
  def change
    add_column :projects, :is_in_carousel, :boolean, default: false
  end
end
