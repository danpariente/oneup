class ApplicationPublication < ActiveRecord::Migration
  def change
    create_table :applications_publications, id: false do |t|
      t.references :application
      t.references :publication      
    end
    add_index :applications_publications, :application_id
    add_index :applications_publications, :publication_id
  end
end
