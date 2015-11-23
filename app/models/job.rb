class Job < ActiveRecord::Base
  belongs_to :project_jobs
  validates :domain_id, presence: true
end
