class AddCompanyFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :industry, :string
    add_column :users, :mobile_number, :integer
    add_column :users, :work_number, :integer
    add_column :users, :registration_number, :integer
  end
end
