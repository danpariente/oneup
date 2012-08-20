class Reference < ActiveRecord::Base
  belongs_to :profile	
  has_and_belongs_to_many :application
end
