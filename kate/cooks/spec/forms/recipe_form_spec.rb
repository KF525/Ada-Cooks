require "rails_helper"

describe RecipeForm do
  before { @recipe = Recipe.new }
  subject { @recipe }

  it "creates a recipe" do
    @new_recipe = Recipe.new(
                      title: "Charging Jerk Frittata",
                      description: "Ball joint charging jerk recall remote.",
                      servings: 2,
                      preparation: "Make it!")

    expect(@new_recipe.title).to eq("Charging Jerk Frittata")
    expect(@new_recipe.description).to eq("Ball joint charging jerk recall remote.")
    expect(@new_recipe.servings).to eq(2)
    expect(@new_recipe.preparation).to eq("Make it!")
  end

  context "when title empty" do
    it { should_not be_valid }
    specify { @recipe.save.should == false }
  end

  context "when title not empty but no directions" do
    before { @recipe.title = "Charging Jerk Frittata" }

    it { should_not be_valid }
    specify {@recipe.save.should == false }
  end

  context "when title not empty, there are directions, and servings present" do
    before { @recipe.title = "Charging Jerk Frittata"}
    before { @recipe.preparation = "Make it!" }
    before { @recipe.servings = 2 }

    it { should be_valid }
    specify {@recipe.save.should == true }
  end

  context "servings must be an integer" do
    before { @recipe.title = "Charging Jerk Frittata"}
    before { @recipe.preparation = "Make it!" }
    before { @recipe.servings = nil }

    it { should_not be_valid}
    specify {@recipe.save.should == false}
  end

  it "creates a usage" do
    @new_usage = Usage.new(
                    unit: "cups",
                    amount: 2,
                    format: "chopped",
                    ingredient_id: 1,
                    recipe_id: 2)

    expect(@new_usage.unit).to eq("cups")
    expect(@new_usage.amount).to eq(2)
    expect(@new_usage.format).to eq("chopped")
    expect(@new_usage.ingredient_id).to eq(1)
    expect(@new_usage.recipe_id).to eq(2)
  end

end
