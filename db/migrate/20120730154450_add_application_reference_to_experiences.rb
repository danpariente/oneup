class AddApplicationReferenceToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :application_id, :integer
  end
end
