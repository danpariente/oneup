class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category
      t.decimal :min_sal
      t.decimal :max_sal
      t.string :type
      t.string :level
      t.string :location

      t.timestamps
    end
  end
end
