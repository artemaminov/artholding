class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html {
        @groups = Group.all
        @projects = Project.all
        @clients = Client.all
      }
      format.js {
        @project = Project.find params[:id]
        @group = params[:group]
      }
    end
  end

  def zoom
    @project = Project.find params[:id]
    @group = params[:group]
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
        render status: :ok
      }
    end
  end


end
