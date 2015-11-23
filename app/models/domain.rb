class Domain < ActiveRecord::Base
  has_many :jobs

  validates :label, presence: true
end
