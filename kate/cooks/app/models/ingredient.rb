class Ingredient < ActiveRecord::Base
  has_many :usages
  has_many :recipes, through: :usages

end
