class IngredientList < ActiveRecord::Base
  attr_accessible :ingredient_id

  has_many :ingredients
  belongs_to :recipes
end
