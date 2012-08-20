class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :user    
  
  has_and_belongs_to_many :educations
  has_and_belongs_to_many :experiences
  has_and_belongs_to_many :competencies
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :references
  has_and_belongs_to_many :publications
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
  
  def raw_content
    raw = "empty_profile"
    raw += educations.inspect   if educations.present?   
    raw += experiences.inspect  if experiences.present?   
    raw += competencies.inspect if competencies.present?   
    raw += languages.inspect    if languages.present?        
    raw += publications.inspect if publications.present?   

    clean_output(raw)    
  end  

  def clean_spaces(text)
    text.gsub(/\s{2,}|\t|\n|\w+:/, ' ').strip
  end

  def clean_output(text)
    text = text.gsub(/\w+:|\"|\\|\d|[<>#\[\],-]|(nil)|\//, ' ').strip    
    text = clean_spaces(text)
    text
  end

end
