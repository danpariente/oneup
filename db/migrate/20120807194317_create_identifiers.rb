class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.references :profile
      t.string :id_type
      t.string :identifier

      t.timestamps
    end
    add_index :identifiers, :profile_id
  end
end
