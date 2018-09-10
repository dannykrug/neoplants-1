class State < ApplicationRecord
  belongs_to :plant_type
  has_many :plants
end
