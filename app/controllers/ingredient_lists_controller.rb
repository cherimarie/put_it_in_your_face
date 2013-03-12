class IngredientListsController < ApplicationController
  # GET /ingredient_lists
  # GET /ingredient_lists.json
  before_filter :find_all_ingredients
  before_filter :generate, :only => [:index]


  def index
    @ingredient_lists = IngredientList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingredient_lists }
    end
  end

  # GET /ingredient_lists/1
  # GET /ingredient_lists/1.json
  def show
    @ingredient_list = IngredientList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient_list }
    end
  end

  # GET /ingredient_lists/new
  # GET /ingredient_lists/new.json
  def new
    @ingredient_list = IngredientList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredient_list }
    end
  end

  # GET /ingredient_lists/1/edit
  def edit
    @ingredient_list = IngredientList.find(params[:id])
  end

  # POST /ingredient_lists
  # POST /ingredient_lists.json
  def create
    @ingredient_list = IngredientList.new(:size => params[:ingredient_list][:size],
                                          :protein => 9,
                                          :calcium => 9,
                                          :calories => 9 )

    respond_to do |format|
      if @ingredient_list.save
        format.html { redirect_to @ingredient_list, notice: 'Ingredient list was successfully created.' }
        format.json { render json: @ingredient_list, status: :created, location: @ingredient_list }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredient_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredient_lists/1
  # PUT /ingredient_lists/1.json
  def update
    @ingredient_list = IngredientList.find(params[:id])

    respond_to do |format|
      if @ingredient_list.update_attributes(params[:ingredient_list])
        format.html { redirect_to @ingredient_list, notice: 'Ingredient list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_lists/1
  # DELETE /ingredient_lists/1.json
  def destroy
    @ingredient_list = IngredientList.find(params[:id])
    @ingredient_list.destroy

    respond_to do |format|
      format.html { redirect_to ingredient_lists_url }
      format.json { head :no_content }
    end
  end

  protected
  def find_all_ingredients
    @ingredients = Ingredient.all
  end

  def generate(size = 3)

    @calories_ceiling = [693,  910,  1083, 1300][size]
    @calories_floor   = [426,  560,  666,  800 ][size]
    @calcium_ceiling  = [390,  390,  390,  390 ][size]
    @calcium_floor    = [240,  240,  240,  240 ][size]
    @protein_ceiling  = [12.6, 16.9, 21.7, 26  ][size]
    @protein_floor    = [7.8,  10.4, 13.4, 16  ][size]

    count = 0
    loop do
      count += 1
      @random_ingredients = find_some_ingredients_with_calories(@ingredients.shuffle,
                                                                @calories_ceiling,
                                                                @calories_floor)
      meets_protein_requirements = @protein > @protein_floor &&
                                   @protein < @protein_ceiling
      meets_calcium_requirements = @calcium > @calcium_floor &&
                                   @calcium < @calcium_ceiling
      break if meets_protein_requirements && meets_calcium_requirements
      break if count > 1000
    end
  end

  def find_some_ingredients_with_calories(ingredients, ceiling, floor)
    random_ingredients, @calories, @calcium, @protein = [], 0, 0, 0

    ingredients.each do |ingredient|
      random_ingredients << ingredient
      @calories += ingredient.calories
      @calcium  += ingredient.calcium
      @protein  += ingredient.protein

      random_ingredients, @calories = [], 0 if @calories > ceiling

      break if @calories > floor
    end

    return random_ingredients
  end

#  def generate(size = 1)
#    find_all_ingredients
#    @size = size.to_i
#
#    # 80% - 130% of ideal for each
#    @calories_ceiling = [693,  910,  1083, 1300][@size]
#    @calories_floor   = [426,  560,  666,  800 ][@size]
#    @calcium_ceiling  = [390,  390,  390,  390 ][@size]
#    @calcium_floor    = [240,  240,  240,  240 ][@size]
#    @protein_ceiling  = [7.8,  16.9, 13.4, 16  ][@size]
#    @protein_floor    = [12.6, 10.4, 21.7, 26  ][@size]
#
#    count = 0
#    loop do
#      count += 1
#      @random_ingredients, @calories, @calcium, @protein = [], 0, 0, 0
#
#      @ingredients.each do |ingredient|
#        @random_ingredients << ingredient
#        @calories += ingredient.calories
#        @calcium  += ingredient.calcium
#        @protein  += ingredient.protein
#
#        if @calories > @calories_ceiling
#          @random_ingredients, @calories, @calcium, @protein = [], 0, 0, 0
#        end
#
#        break if @calories > @calories_floor
#      end
#
#      meets_protein_requirements = @protein > @protein_floor &&
#                                   @protein < @protein_ceiling
#      meets_calcium_requirements = @calcium > @calcium_floor &&
#                                   @calcium < @calcium_ceiling
#      break if meets_protein_requirements && meets_calcium_requirements
#      break if count > 1000
#    end
#
#
#    count > 1000 ? @random_ingredients : "Loop too deep, dude!"
#  end
#

end
