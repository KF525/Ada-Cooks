class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe_form = RecipeForm.new(params[:recipe_form])

    if @recipe_form.submit
      flash[:notice] = "Your recipe was successfully created."
      redirect_to recipe_path(@recipe_form.recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @usages = Usage.where(recipe_id: params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @usages = Usage.where(recipe_id: params[:id])
    @ingredient = Ingredient.new

    @usage_ingredients_id = []

    @usages.each do |usage|
      @usage_ingredients_id << usage.ingredient_id
    end

    @unused_ingredients = Ingredient.all.where.not(id: @usage_ingredients_id )
  end

  def update
    recipe_id = Recipe.find(params[:id]).id
    @recipe_form = RecipeForm.new(params[:recipe_form])

    if @recipe_form.resubmit(recipe_id)
      flash[:notice] = "Your recipe was successfully updated."
      redirect_to recipe_path(recipe_id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path
    else
      render :recipe
    end
  end
end
