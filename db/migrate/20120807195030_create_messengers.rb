class CreateMessengers < ActiveRecord::Migration
  def change
    create_table :messengers do |t|
      t.references :profile
      t.string :im_type
      t.string :account_name

      t.timestamps
    end
    add_index :messengers, :profile_id
  end
end
