require 'test_helper'

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "creates a recipe" do
    steps = [
      {
        text: "Get 2 cups of atta",
      },
      {
        text: "Boil potatoes",
      },
    ]

    params = { recipe: { title: "Alu Paratha", steps: steps } }

    post api_v1_recipes_url, params: params

    assert_response :success
  end
end
