class RecipeForm

  def initialize(attributes)
    @attributes = attributes
  end

  def recipe
    @recipe
  end

  def submit
    @recipe = Recipe.create(
      title: @attributes[:title],
      description: @attributes[:description],
      servings: @attributes[:servings],
      preparation: @attributes[:preparation],
    )

    hash_num = 0

    if !@attributes[:ingredients].nil?
      @attributes[:ingredients].each do |hash|
        Usage.create(
        ingredient_id: @attributes[:ingredients][hash_num][:id],
        recipe_id: @recipe.id,
        amount: @attributes[:ingredients][hash_num][:amount],
        unit: @attributes[:ingredients][hash_num][:unit],
        format: @attributes[:ingredients][hash_num][:format]
      )
      hash_num +=1
      end
    end

    if !@attributes[:ingredient].nil?
      @attributes[:ingredient].each do |name, description|
        Ingredient.create(
          name: @attributes[:ingredient][:name],
          description: @attributes[:ingredient][:description]
        )
      end
    end
    
    @recipe.valid? #may encounter some bugs, not a full solution - check success
  end

end
