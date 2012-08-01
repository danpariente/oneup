class Education < ActiveRecord::Base
  belongs_to :profile	
  belongs_to :application
end
