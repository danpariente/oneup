class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :about
  has_one :preference
  has_many :educations
  has_many :experiences
  has_many :competencies
  has_many :languages
  has_many :references
  has_many :publications
  has_many :addresses
  has_many :identifiers
  has_many :messengers
  has_many :websites

  after_create :add_name

  def add_name
    self.first_name = user.first_name
    self.last_name = user.last_name          
    self.save
  end


end
