class CreateIngredientLists < ActiveRecord::Migration
  def change
    create_table :ingredient_lists do |t|
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
