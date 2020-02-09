require 'test_helper'

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "creates a recipe" do
    post api_v1_recipes_url, params: { recipe: { title: "alu paratha", description: "alu and paratha == alu paratha" } }

    assert_response :success
  end
end
