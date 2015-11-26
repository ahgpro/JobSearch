class AddDescriptionToProjectJobs < ActiveRecord::Migration
  def change
    add_column :project_jobs, :description, :string
  end
end
