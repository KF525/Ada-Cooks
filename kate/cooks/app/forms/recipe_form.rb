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
          ingredient_id: key,
          recipe_id: @recipe.id,
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

    #create_usages

    #destroy_usages
  end

  def recipe_params

  end

  def usage_params
  end
end
