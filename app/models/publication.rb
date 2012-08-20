class Publication < ActiveRecord::Base
  belongs_to :profile
  has_and_belongs_to_many :application
  attr_accessible :description, :publication_date, :publication_type, :title, :website, :profile_id
end
