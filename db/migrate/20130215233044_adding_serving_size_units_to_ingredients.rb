class AddingServingSizeUnitsToIngredients < ActiveRecord::Migration

  def change
  	remove_column :ingredients, :serving

  	add_column :ingredients, :serving_count, :float
  	add_column :ingredients, :serving_unit, :string
  end


end
