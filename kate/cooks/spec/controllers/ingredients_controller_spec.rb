require "rails_helper"

describe IngredientsController do
  before { @ingredient = Ingredient.new }
  subject { @ingredient }

  it "creates ingredient with name and description" do
    kale = Ingredient.create!(name: "Kale", description: "I'm green and leafy.")

    expect(kale.name).to eq("Kale")
    expect(kale.description).to eq("I'm green and leafy.")
  end

  context "when name empty" do
    it { should_not be_valid }
    specify { @ingredient.save.should == false }
  end

  context "when name not empty" do
    before { @ingredient.name = "kale" }

    it { should be_valid }
    specify {@ingredient.save.should == true }
  end
end
