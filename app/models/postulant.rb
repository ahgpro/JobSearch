class Postulant < ActiveRecord::Base
  belongs_to :project_job
  belongs_to :user

  validates :user_id, presence: true
end
