require 'test_helper'

class IngredientListsControllerTest < ActionController::TestCase
  setup do
    @ingredient_list = ingredient_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_list" do
    assert_difference('IngredientList.count') do
      post :create, ingredient_list: { ingredient_id: @ingredient_list.ingredient_id }
    end

    assert_redirected_to ingredient_list_path(assigns(:ingredient_list))
  end

  test "should show ingredient_list" do
    get :show, id: @ingredient_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_list
    assert_response :success
  end

  test "should update ingredient_list" do
    put :update, id: @ingredient_list, ingredient_list: { ingredient_id: @ingredient_list.ingredient_id }
    assert_redirected_to ingredient_list_path(assigns(:ingredient_list))
  end

  test "should destroy ingredient_list" do
    assert_difference('IngredientList.count', -1) do
      delete :destroy, id: @ingredient_list
    end

    assert_redirected_to ingredient_lists_path
  end
end
