class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.references :user
      t.references :job

      t.timestamps
    end
    add_index :watches, :user_id
    add_index :watches, :job_id
  end
end
