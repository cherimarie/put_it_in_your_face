class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :serving
      t.text :nutritional_info

      t.timestamps
    end
  end
end
