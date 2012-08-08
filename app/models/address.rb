class Address < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :address, :address_type
end
