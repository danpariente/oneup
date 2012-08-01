class Interview < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  belongs_to :application
  attr_accessible :date, :mode, :notes, :time, :user_id, :job_id
end
