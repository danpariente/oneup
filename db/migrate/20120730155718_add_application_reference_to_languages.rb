class AddApplicationReferenceToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :application_id, :integer
  end
end
