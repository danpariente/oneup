class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :language
      t.string :level
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end
