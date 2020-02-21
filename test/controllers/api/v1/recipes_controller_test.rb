require 'test_helper'

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "creates a recipe" do
    steps = [
      {
        order: 1,
        text: "Get 2 cups of atta",
      },
      {
        order: 2,
        text: "Boil potatoes",
      },
    ]

    params = { recipe: { name: "Alu Paratha", cuisine: Recipe::Cuisine::INDIAN, steps: steps } }

    assert_difference ->{ Recipe.count } => 1, ->{ Step.count } => 2 do
      post api_v1_recipes_url, params: params
    end

    assert_response :success
  end

  test "not specifying recipe results in error response" do
    post api_v1_recipes_url, params: {}

    assert_response 400

    error_response = {
      errors: [
        {
          source: { pointer: "/recipe", },
          title: "Missing attribute",
          detail: "Please specify a recipe",
        },
      ]
    }.to_json

    assert_equal(@response.body, error_response)
  end

  test "lack of steps results in an error" do
    params = { recipe: { no_steps: { title: "foo" } } }
    post api_v1_recipes_url, params: params

    assert_response 400

    error_response = {
      errors: [
        {
          source: { pointer: "/recipe/steps", },
          title: "Missing attribute",
          detail: "Please specify steps to create recipe",
        },
      ]
    }.to_json

    assert_equal(@response.body, error_response)
  end
end

