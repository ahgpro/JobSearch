class ProjectJob < ActiveRecord::Base
  belongs_to :project
  belongs_to :job

  has_many :postulants
  has_many :users, through: :postulants

  validates :project_id, presence: true

  validates :number, :numericality => { :greater_than => 0 }
  # validates :job, presence: true
end
