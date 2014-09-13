class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html {
        @groups = Group.all
        @projects = Project.all.order position: :asc
        @clients = Client.all
      }
      format.js {
        load_neighbours "project_path"
      }
    end
  end

  def zoom
    load_neighbours "project_zoom_path"
    respond_to do |format|
      format.html {
        render partial: 'shared/project_zoom'
      }
      format.js
    end
  end

  def order
    respond_to do |format|
      format.js {
        Order.complete(params[:order]).deliver
      }
    end
  end

  private

  def load_neighbours path
    @group = params[:group]
    @project = Project.find_neighbours params[:id], @group
    if @project.prev_one.nil?
      @link_to_prev_project = false
    else
      @link_to_prev_project = eval("#{path}(id: @project.prev_one, group: @group)")
    end
    if @project.next_one.nil?
      @link_to_next_project = false
    else
      @link_to_next_project = eval("#{path}(id: @project.next_one, group: @group)")
    end
  end


end
