class StaticPagesController < ApplicationController
  layout 'demo'
  skip_before_filter :authenticate_user!
  
  def home
  
  end
  
  def index
    @projects = Array.new
    all_projects = Project.all
    for project in all_projects
      if project.pages.length > 0
        @projects.push(project)
      end
    end
  end
  
  def page
    set_project()
    @page = @project.pages.find(params[:id])
  end
  
  private
    def set_project
      @project = Project.find(params[:project_id])
    end
end
