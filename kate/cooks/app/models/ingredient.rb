class Ingredient < ActiveRecord::Base
  has_many :usages
  has_many :recipes, through: :usages

  validates :name, presence: true, uniqueness: {case_sensitve: false}

  def self.alphabetize
    all.sort {|a, b| a.name <=> b.name}
  end
end
