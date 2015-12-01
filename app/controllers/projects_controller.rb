class ProjectsController < ApplicationController

 before_action :find_project, only: [:show, :destroy]



  def index
    # if params[:search] and (not params[:search][:job].blank? or not params[:search][:address].blank?)
    # if params[:search][:jobs] && params[:search][:address]
    #   @projects = Project.where(address: params[:search][:address]) && Project.where(jobs: params[:search][:jobs])
    # elsif params[:search][:address]
    #   @projects = Project.where(jobs: params[:search][:jobs])
    # elsif params[:search][:jobs]
      # @projects = Project.where(address: params[:search][:address])

    @projects = policy_scope(Project).includes(:jobs)

    if params[:search] and (not params[:search][:job_id].blank? or not params[:search][:address].blank?)

      if not params[:search][:address].blank?
        @projects = @projects.near(params[:search][:address], 100)
      end

      if not params[:search][:job_id].blank?
        @projects = @projects.select do |project|
          project.jobs.where(id: params[:search][:job_id]).count > 0
        end
      end
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
