class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_jobs, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
