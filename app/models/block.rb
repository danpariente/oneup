class Block < ActiveRecord::Base
  belongs_to :users_blocking, class_name: 'User', foreign_key: 'user_id'
  belongs_to :blocked_jobs, class_name: 'Job', foreign_key: 'job_id'
  # attr_accessible :title, :body
end
