class AddSizeAndDietaryRestrictionToUser < ActiveRecord::Migration
  def change
  	add_column :users, :size, :integer
  	add_column :users, :dietary_restrictions, :string
  end
end
