class Address < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :address, :address_type, :profile_id
end
