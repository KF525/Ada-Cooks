class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.integer :amount
      t.string :unit
      t.string :type
      t.string :ingredient_id
      t.string :recipe_id

      t.timestamps
    end
  end
end
