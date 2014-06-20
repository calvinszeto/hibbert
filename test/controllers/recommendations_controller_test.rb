require 'test_helper'

class RecommendationsControllerTest < ActionController::TestCase
  setup do
    @recommendation = recommendations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommendation" do
    assert_difference('Recommendation.count') do
      post :create, recommendation: { date_recommended: @recommendation.date_recommended, restaurant_id: @recommendation.restaurant_id, source_id: @recommendation.source_id, website: @recommendation.website }
    end

    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  test "should show recommendation" do
    get :show, id: @recommendation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommendation
    assert_response :success
  end

  test "should update recommendation" do
    patch :update, id: @recommendation, recommendation: { date_recommended: @recommendation.date_recommended, restaurant_id: @recommendation.restaurant_id, source_id: @recommendation.source_id, website: @recommendation.website }
    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  test "should destroy recommendation" do
    assert_difference('Recommendation.count', -1) do
      delete :destroy, id: @recommendation
    end

    assert_redirected_to recommendations_path
  end
end
