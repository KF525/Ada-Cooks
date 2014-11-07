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

    handle_usages
  end

  def handle_usages
    @usages = @attributes[:usages]

    if !@usages.nil?
      @usages.each do |usage| # {ingredient_id=> 1, amount => 3, unit => cups, format => chopped}
          @usage = Usage.new(
          recipe_id: @recipe.id,
          amount: usage[:amount],
          unit: usage[:unit],
          format: usage[:format],
          ingredient_id: usage[:ingredient_id]
          )

        if @usage.valid?
          @usage.save
        end
      end
    end
  end
end
