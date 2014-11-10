class Usage < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe_id, presence: true, numericality: true
  validates :ingredient_id, presence: true, numericality: true

  def usage_by_ingredient_id
    ingredient.usages.find_by(recipe_id: @recipe.id)
  end
end
