class AddNutritionToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :calories, :integer
    add_column :ingredients, :protein,  :float
    add_column :ingredients, :calcium,  :float

    remove_column :ingredients, :nutritional_info
  end
end
