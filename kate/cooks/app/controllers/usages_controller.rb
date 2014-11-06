class UsagesController < ApplicationController

  def create
    @usage = Usage.new(params.require(:usage).permit(:amount, :unit, :format))
    @usage.recipe_id = params[:id]
    #@usage.ingredient_id = ?
    @usage.save
  end

  def destroy
    @usage = Usage.find(params[:id])
    @usage.destroy
    redirect_to recipes_path
  end

end
