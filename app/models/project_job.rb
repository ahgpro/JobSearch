class ProjectJob < ActiveRecord::Base
  belongs_to :project
  has_many :jobs

  validates :project_id, presence: true
  validates :job_id, presence: true
end
