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

    response_body = JSON.parse(@response.body).with_indifferent_access
    assert_not_nil(response_body[:external_id])

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

  test "step without content results in an error" do
    steps = [
      {
        order: 1,
      },
      {
        order: 2,
        text: "Boil potatoes",
      },
    ]

    params = { recipe: { name: "Alu Paratha", cuisine: Recipe::Cuisine::INDIAN, steps: steps } }
    post api_v1_recipes_url, params: params

    assert_response 422

    error_response = {
      errors: [
        {
          source: { pointer: "/recipe/step/text", },
          title: "text - can't be blank",
        },
      ]
    }.to_json

    assert_equal(@response.body, error_response)
  end

  test "deleting a recipe sets it to inactive" do
    recipe = Recipe.where(is_active: true).first

    delete "/api/v1/recipes/#{recipe.external_id}"
    assert_equal(recipe.reload.is_active, false)
  end

  test "deleting a recipe with an invalid id results in an error" do
    delete "/api/v1/recipes/idonotexist"
    assert_response 404

    error_response = {
      errors: [
        {
          source: { pointer: "/external_id" },
          title: "Resource not found",
          detail: "There is no active recipe by this id",
        },
      ]
    }.to_json

    assert_equal(@response.body, error_response)
  end
end

