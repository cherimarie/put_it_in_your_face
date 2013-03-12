class IngredientList < ActiveRecord::Base
  attr_accessible :ingredient_id, :calories, :protein, :calcium, :size

  has_many :ingredients
  belongs_to :recipes
end
