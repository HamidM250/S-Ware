class Schedulejobtype < ActiveRecord::Base
  attr_accessible :job, :volscheduler_id

  belongs_to :volscheduler
  has_many :scheduledjobtypes
end
