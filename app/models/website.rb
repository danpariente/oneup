class Website < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :url, :website_type, :profile_id
end
