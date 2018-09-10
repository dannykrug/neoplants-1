class Plant < ApplicationRecord
  belongs_to :ailment, optional:true
end
