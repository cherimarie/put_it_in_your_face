class Ingredient < ActiveRecord::Base
  attr_accessible :name, :serving, :calories, :protein, :calcium

  belongs_to :ingredient_lists
  validates :name, presence: true

end
