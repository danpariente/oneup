class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable	
  has_many :likes, :as => :likeable

  scope :applications_feed, where(activity_type: 'application').order('created_at DESC')  
  scope :recent, order('created_at DESC').limit(5)
end
