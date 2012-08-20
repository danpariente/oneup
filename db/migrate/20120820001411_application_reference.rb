class ApplicationReference < ActiveRecord::Migration
  def change
    create_table :applications_references, id: false do |t|
      t.references :application
      t.references :reference      
    end
    add_index :applications_references, :application_id
    add_index :applications_references, :reference_id
  end
end
