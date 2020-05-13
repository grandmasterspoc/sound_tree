class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    project = current_user.projects.new(project_params)
    # raise "hell"
    if project.save
      redirect_to project_path(project)
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
