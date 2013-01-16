class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :ingredient_list_id
      t.text :instructions

      t.timestamps
    end
  end
end
