class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.references :profile
      t.string :website_type
      t.string :url

      t.timestamps
    end
    add_index :websites, :profile_id
  end
end
