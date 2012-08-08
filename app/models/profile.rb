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
end
