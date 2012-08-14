class Identifier < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :identifier_type, :identifier, :profile_id
end
