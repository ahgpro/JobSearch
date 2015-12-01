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

  # def validate_candidate

    # if @postulant.project_job.add?
    #   candidate = @postulant.new
    #   candidate.save
    # end

    # if @postulant.project_job.add?
    #   candidate = Candidate.new
    #   candidate.save
    # end

    # if @postulant.project_job.add?
    #   postulant = Postulant.new
    #   postulant.save
    # end

    # if @postulant(params[:id]).project_job.add?
    #   postulant = Postulant.new
    #   postulant.save
    # end

  # end

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



