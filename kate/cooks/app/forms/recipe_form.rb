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

    @usages.each do |usage| # {ingredient_id=> 1, amount => 3, unit => cups, format => chopped}
      if !usage[:ingredient_id].nil?
        @usage = Usage.create!(
          recipe_id: @recipe.id,
          amount: usage[:amount],
          unit: usage[:unit],
          format: usage[:format],
          ingredient_id: usage[:ingredient_id]
        )
      end
    end
  end

  def resubmit
    raise params.inspect
  end

end
