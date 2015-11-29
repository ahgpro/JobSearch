class ProjectJobsController < ApplicationController

  before_action :find_project, only: [ :new, :create]

  def show
    @postulants = Postulant.all
    @project_job = ProjectJob.find(params[:id])
  end

  def create
    @project_job = @project.project_jobs.build(project_job_params)
    authorize @project_job
    if @project_job.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project_job = ProjectJob.find(params[:id])
    @project_job.destroy
    redirect_to project_path(@project_job.project_id)
  end

  private

  def project_job_params
    params.require(:project_job).permit(:job_id, :number, :description)
  end
  def find_project
    @project = Project.find(params[:project_id])
  end

end

end



