class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :mode
      t.date :date
      t.time :time
      t.text :notes
      t.references :job
      t.references :user
      t.references :application

      t.timestamps
    end
    add_index :interviews, :job_id
    add_index :interviews, :user_id
    add_index :interviews, :application_id
  end
end
