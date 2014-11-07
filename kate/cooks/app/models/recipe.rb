class Recipe < ActiveRecord::Base
  has_many :usages
  has_many :ingredients, through: :usages
  belongs_to :user

  validates :title, presence: true, uniqueness: {case_sensitve: false}
  validates :preparation, presence: true
  validates :description, length: { maximum: 200 }
  validates :servings, numericality: true
end
