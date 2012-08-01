class AddApplicationReferenceToCompetencies < ActiveRecord::Migration
  def change
    add_column :competencies, :application_id, :integer
  end
end
