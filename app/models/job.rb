class Job < ActiveRecord::Base
  attr_accessible :job_title, :job_type, :job_category, :working_location, :responsability, 
  :lowest_education_level, :highest_education_level, :age_min, :age_max, :salary_min, :salary_max,
  :negotiable, :travel, :relocate, :address, :latitude, :longitude	

  belongs_to :user
  has_many :applications
  has_many :interviews
  has_many :watches
  has_many :users_watching, through: :watches, class_name: 'User', foreign_key: 'job_id'
  has_many :blocks 
  has_many :users_blocking, through: :blocks, class_name: 'User', foreign_key: 'job_id'

  geocoded_by :full_street_address

  after_validation :geocode, :if => :address_changed?		


  def self.search(search)
    q = "%#{search}%"
    if search
      where('job_title LIKE ? or job_category LIKE ?', q, q)
    else
      where('job_title != ? or job_category != ?', 'ztgdan', 'ztgdan')
    end
  end

end
