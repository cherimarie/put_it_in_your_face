class IngredientListsController < ApplicationController
  # GET /ingredient_lists
  # GET /ingredient_lists.json
  before_filter :find_all_ingredients
  before_filter :generate, :only => [:index, :show]


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
    @ingredient_list = IngredientList.new(params[:ingredient_list])

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

  def generate
    find_all_ingredients

    @med_calories_ceiling = 750
    @med_calories_floor   = 600
    @med_calcium_ceiling  = 375
    @med_calcium_floor    = 275
    @med_protein_ceiling  =  20
    @med_protein_floor    =  10

    loop do
      @random_ingredients = find_some_ingredients_with_calories(@ingredients.shuffle,
                                                                @med_calories_ceiling,
                                                                @med_calories_floor)
      meets_protein_requirements = @protein > @med_protein_floor &&
                                   @protein < @med_protein_ceiling
      meets_calcium_requirements = @calcium > @med_calcium_floor &&
                                   @calcium < @med_calcium_ceiling
      break if meets_protein_requirements && meets_calcium_requirements
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
end
