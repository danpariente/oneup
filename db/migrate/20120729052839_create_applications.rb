class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :objective
      t.integer :min_salary
      t.integer :max_salary
      t.string :availability
      t.references :job
      t.references :user
      t.string :status

      t.timestamps
    end
    add_index :applications, :job_id
    add_index :applications, :user_id
  end
end
