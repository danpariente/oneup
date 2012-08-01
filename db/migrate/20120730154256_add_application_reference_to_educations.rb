class AddApplicationReferenceToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :application_id, :integer
  end
end
