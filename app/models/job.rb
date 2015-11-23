class Job < ActiveRecord::Base
  has_many :project_jobs
  belongs_to :domain
  validates :domain_id, presence: true
end
