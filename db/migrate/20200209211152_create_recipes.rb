class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :cuisine, null: false
      t.string :external_id, null: false

      t.timestamps
    end
  end
end
