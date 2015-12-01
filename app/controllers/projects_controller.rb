class ProjectsController < ApplicationController

 before_action :find_project, only: [:show, :destroy]



  def index
    if params[:search] and (not params[:search][:job].blank? or not params[:search][:address].blank?)
      # @projects = Project.where(job: params[:job] || address: params[:address])
    else
      @projects = policy_scope(Project)
    end
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
      ProjectMailer.creation_confirmation(@project).deliver_now
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
    @project = Project.find(project_params[:id])
    authorize @project
  end

  def project_params
    params.permit(:job, :title, :description, :media, :id)
  end

end

