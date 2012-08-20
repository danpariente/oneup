class ApplicationExperience < ActiveRecord::Migration
  def change
    create_table :applications_experiences, id: false do |t|
      t.references :application
      t.references :experience
    end
    add_index :applications_experiences, :application_id
    add_index :applications_experiences, :experience_id
  end
end
