class Job < ActiveRecord::Base
  belongs_to :domain
  validates :domain_id, presence: true
end
