class Ingredient < ActiveRecord::Base
  attr_accessible :name, :nutritional_info, :serving

  belongs_to :ingredient_lists

end
