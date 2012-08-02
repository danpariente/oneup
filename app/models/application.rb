class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :user    
  has_many :educations
  has_many :experiences
  has_many :competencies
  has_many :languages
  has_many :references
  has_many :publications
  has_many :interviews

  scope :applied_only, where(status: 'Applied').order('created_at DESC')
  scope :declined_only, where(status: 'Declined').order('created_at DESC')
  scope :interview_only, where(status: 'Interview').order('created_at DESC')

  attr_accessible :availability, :max_salary, :min_salary, :objective, :status, :job_id, :user_id, :education_ids, :experience_ids, :competency_ids, :reference_ids, :publication_ids
  
  after_create :add_activity

  def add_activity
    self.status = 'Applied'
    self.save
    Activity.create(:user_id => self.user.id, :activity_type => 'application', :text => "#{self.user.formatted_name} Applied to a new to Job <a href='/user/#{self.user.username}/applications/#{self.id}'>#{self.job.job_title}</a>.")
  end 
end
