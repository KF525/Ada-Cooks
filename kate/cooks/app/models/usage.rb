class Usage < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  
end
