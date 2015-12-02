class PostulantsController < ApplicationController
  before_action :set_project_job, only: [ :create ]

  # /projects/:project_id/project_jobs/:project_job_id/postulants
  def create
    @postulant = @project_job.postulants.build(user: current_user)
    authorize @postulant
    @postulant.save
    redirect_to project_path(@project_job.project)
  end

  def destroy
    @postulant = Postulant.find(params[:id])
    @postulant.destroy
    redirect_to project_path(@postulant.project_job_id)
  end

  def new

  end

  def accepted
    @postulant = Postulant.find(params[:id])
    @postulant.status = true
    @postulant.save
    authorize @postulant
    @project_job = @postulant.project_job
    @project_job.number -= 1
    @project_job.save
    redirect_to :back
  end

  def rejected
    @postulant = Postulant.find(params[:id])
    @postulant.status = false
    @postulant.save
    authorize @postulant
    redirect_to :back
  end


  private

  def set_project_job
    @project_job = ProjectJob.find(params[:project_job_id])
  end


  def postulant_params
    params.require(:postulant).permit(:project_jobs_id, :user_id)
  end

end
