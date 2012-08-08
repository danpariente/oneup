class AddInformationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :nationality, :string
    add_column :profiles, :work_pass_visa, :string
    add_column :profiles, :race, :string
  end
end
