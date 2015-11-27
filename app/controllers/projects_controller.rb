class ProjectsController < ApplicationController

 before_action :find_project, only: [:show, :destroy]

  def index
    @projects = policy_scope(Project)
  end

  def show
    @project_job = ProjectJob.new
    @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = current_user.projects.new(project_params)
    authorize @project
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
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :description, :media)
  end

end
