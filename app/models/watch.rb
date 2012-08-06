class Watch < ActiveRecord::Base
  belongs_to :users_watching, class_name: 'User', foreign_key: 'user_id'
  belongs_to :watched_jobs, class_name: 'Job', foreign_key: 'job_id'
  # attr_accessible :title, :body
end
