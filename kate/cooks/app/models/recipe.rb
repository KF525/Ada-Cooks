class Recipe < ActiveRecord::Base
  has_many :usages
  has_many :ingredients, through: :usages
  belongs_to :user

  #scope :by_ingredient, joins(:ingredients)
end
