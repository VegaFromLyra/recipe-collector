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

  test "not specifying recipe results in error response" do
    post api_v1_recipes_url, params: {}

    assert_response 400

    error_response = {
      errors: [
        {
          source: { pointer: "/recipe", },
          title: "Please specify a recipe",
          detail: "A top level recipe object is required",
        },
      ]
    }.to_json

    assert_equal(@response.body, error_response)
  end
end

