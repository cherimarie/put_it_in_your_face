class AddSizeToIngredientList < ActiveRecord::Migration
  def change
  	add_column :ingredient_lists, :size, :integer
  end
end
