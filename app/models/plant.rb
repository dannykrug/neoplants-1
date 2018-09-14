class Plant < ApplicationRecord
  belongs_to :ailment, optional:true
  belongs_to :user
  belongs_to :state
  validates :name,  presence: true
  @@death_message = ["Dysentery", "Over Exposure to Sunlight", "Too Much Rain", "Dog Ate It", "Bugz", "Roommate Drunkenly Pissed On It"]
  def plant_type_name
    self.state.plant_type.name
  end

  def self.death_message
    @@death_message
  end

end
