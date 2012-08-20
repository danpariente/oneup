class ApplicationEducation < ActiveRecord::Migration
  def change
    create_table :applications_educations, id: false do |t|
      t.references :application
      t.references :education      
    end
    add_index :applications_educations, :application_id
    add_index :applications_educations, :education_id
  end
end
