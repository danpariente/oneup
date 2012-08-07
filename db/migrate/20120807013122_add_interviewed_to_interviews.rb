class AddInterviewedToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :interviewed_id, :integer
  end
end
