class ApplicationCompetency < ActiveRecord::Migration
  def change
    create_table :applications_competencies, id: false do |t|
      t.references :application
      t.references :competency      
    end
    add_index :applications_competencies, :application_id
    add_index :applications_competencies, :competency_id
  end
end
