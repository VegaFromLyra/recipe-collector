require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
   test "sets external id" do
     recipe = Recipe.create!(name: "Chicken Biriyani", cuisine: Recipe::Cuisine::INDIAN)
     assert_not_nil recipe.external_id
   end
end
