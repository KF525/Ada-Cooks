require "rails_helper"

describe IngredientsController do

  it "creates ingredient with name and description" do
    kale = Ingredient.create!(name: "Kale", description: "I'm green and leafy.")

    expect(kale.name).to eq("Kale")
    expect(kale.description).to eq("I'm green and leafy.")
  end
  
end
