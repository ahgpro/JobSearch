class ProjectJob < ActiveRecord::Base
  belongs_to :project, dependent: :destroy
  belongs_to :job

  has_many :postulants
  has_many :users, through: :postulants

  validates :project_id, presence: true
  # validates :job, presence: true
end
