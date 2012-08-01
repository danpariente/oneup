class AddApplicationReferenceToReferences < ActiveRecord::Migration
  def change
    add_column :references, :application_id, :integer
  end
end
