class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :publication_type
      t.string :title
      t.string :website
      t.text :description
      t.date :publication_date
      t.references :profile
      t.references :application

      t.timestamps
    end
    add_index :publications, :profile_id
    add_index :publications, :application_id
  end
end
