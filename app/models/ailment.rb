class Ailment < ApplicationRecord
  belongs_to :action
  has_many :plants
end
