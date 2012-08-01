class Competency < ActiveRecord::Base
  belongs_to :profile	
  belongs_to :application
end
