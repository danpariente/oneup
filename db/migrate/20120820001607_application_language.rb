class ApplicationLanguage < ActiveRecord::Migration
  def change
    create_table :applications_languages, id: false do |t|
      t.references :application
      t.references :language      
    end
    add_index :applications_languages, :application_id
    add_index :applications_languages, :language_id
  end
end
