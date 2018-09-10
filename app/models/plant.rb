class Plant < ApplicationRecord
  belongs_to :ailment, optional:true
  belongs_to :user
  belongs_to :state
  @@death_message = ["Dysentary", "Over Exposure to Sunlight", "Too Much Rain", "Dog Ate It", "Bugz", "Roommate Drunkenly Pissed On It"]
end
