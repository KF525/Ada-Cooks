class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    raise params.inspect
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
    #num = @recipe.user_id
    #@user = User.find(num)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @usages = Usage.where(recipe_id: params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe_form.update
      flash[:notice] = "Your recipe was successfully updated."
      redirect_to recipe_path(@recipe)
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
