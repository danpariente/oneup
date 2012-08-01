class Publication < ActiveRecord::Base
  belongs_to :profile
  belongs_to :application
  attr_accessible :description, :publication_date, :publication_type, :title, :website, :profile_id
end
