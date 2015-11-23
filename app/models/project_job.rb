class ProjectJob < ActiveRecord::Base
  belongs_to :project
  has_many :jobs
  has_many :postulants

  validates :project_id, presence: true
  validates :job_id, presence: true
end
