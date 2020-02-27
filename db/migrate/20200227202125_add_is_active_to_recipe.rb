class AddIsActiveToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :is_active, :bool, null: false, default: true
  end
end
