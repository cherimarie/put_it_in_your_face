class Recipe < ActiveRecord::Base
  attr_accessible :ingredient_list_id, :instructions, :name, :calories, :protein, :calcium

  has_one :ingredient_list


end
