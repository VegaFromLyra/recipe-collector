class ChangeExternalIdOnRecipeNullable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :external_id, true
  end
end
