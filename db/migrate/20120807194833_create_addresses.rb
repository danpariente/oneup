class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :profile
      t.string :address_type
      t.string :address

      t.timestamps
    end
    add_index :addresses, :profile_id
  end
end
