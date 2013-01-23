class Recipe < ActiveRecord::Base
  attr_accessible :ingredient_list_id, :instructions, :name

  has_one :ingredient_list
end
