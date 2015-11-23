class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_jobs
  has_many :postulants, through: :project_jobs
  has_many :users, through: :postulants
  has_many :jobs, through: :project_jobs


  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
