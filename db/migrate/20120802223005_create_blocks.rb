class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :user
      t.references :job

      t.timestamps
    end
    add_index :blocks, :user_id
    add_index :blocks, :job_id
  end
end
