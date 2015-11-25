class ProjectsController < ApplicationController

 before_action :find_project, only: [:show, :destroy]

  def index
    @projects = Project.all

  end

  def show
    @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    bye-bug
    if @project.save
      redirect_to @project

    else
      render :new
    end
  end


  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :media)
  end

end
