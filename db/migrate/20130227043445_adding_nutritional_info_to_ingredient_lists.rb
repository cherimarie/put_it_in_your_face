class AddingNutritionalInfoToIngredientLists < ActiveRecord::Migration
  def change
  	add_column :ingredient_lists, :calories, :integer
  	add_column :ingredient_lists, :protein, :float
  	add_column :ingredient_lists, :calcium, :float
  end




end
