class RenameColSearch < ActiveRecord::Migration
  def change
    rename_column :searches, :type, :job_type
  end
end
