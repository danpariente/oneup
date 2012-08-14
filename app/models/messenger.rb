class Messenger < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :account_name, :im_type, :profile_id
end
