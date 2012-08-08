class Identifier < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :id_type, :identifier
end
