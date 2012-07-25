class AddUserwallidsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :user_id, :integer
    add_column :events, :wall_id, :integer
  end

  def self.down
    remove_column :events, :wall_id
    remove_column :events, :user_id
  end
end
