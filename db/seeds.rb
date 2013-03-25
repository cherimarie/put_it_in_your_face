# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

File.open("#{Rails.root}/ingr.dmp") do |ingredient|
  ingredient.read.each_line do |ingredient|
  	id,
    name,
     calories,
     protein,
     calcium,
     serving_count,
     serving_unit =
     ingredient.chomp.split(",")
    #  to remove the quotes from the csv text:
    # to create each record in the database
    Ingredient.create!(:name => name.tr('"', ''), :calories => calories,
    				    :protein => protein, :calcium => calcium,
    				    :serving_count => serving_count, :serving_unit => serving_unit)
  end
end