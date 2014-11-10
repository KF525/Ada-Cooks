class RecipeForm

  def initialize(attributes)
    @attributes = attributes
  end

  def recipe
    @recipe
  end

  def submit
    @recipe = Recipe.new(
      title: @attributes[:title],
      description: @attributes[:description],
      servings: @attributes[:servings],
      preparation: @attributes[:preparation]
    )

    @recipe.save!

    create_usages
  end

  def create_usages
    @usages = @attributes[:usages]

    @usages.keys.each do |key| #{ 1 => {amount => 3, unit => cups, format => chopped}
      if @usages[key][:checked]
        @usage = Usage.create!(
          ingredient_id: key.to_i,
          recipe_id: @recipe.id.to_i,
          amount: @usages[key][:amount],
          unit: @usages[key][:unit],
          format: @usages[key][:format],
        )
      end
    end
  end

  def resubmit(recipe_id)
    @recipe = Recipe.find(recipe_id)
    @recipe.update(
    title: @attributes[:title],
    description: @attributes[:description],
    servings: @attributes[:servings],
    preparation: @attributes[:preparation]
    )

    destroy_usages
    update_usages
    create_usages
  end

  def destroy_usages
    @usages = @attributes[:usages]

    @usages.keys.each do |key|
      if !@usages[key][:checked]
        delete_usages = Usage.where("ingredient_id = ? AND recipe_id = ?", key, "#{@recipe.id}")
        delete_usages.each do |usage|
          usage.destroy
        end
      end
    end
  end

  def update_usages
    @recipe.usages.each do |usage|
        usage.amount = @attributes[:usages][usage.ingredient_id][:amount],
        usage.unit = @attributes[:usages][usage.ingredient_id][:unit],
        usage.format = @attributes[:usages][usage.ingredient_id][:format]
        usage.save
    end
  end
end
