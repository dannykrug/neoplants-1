class User < ApplicationRecord
  has_secure_password
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :plants
  @@female_options = ["Muffins", "Drake", "Vodka", "Williamsburg", "Poodles", "Salad", "Team Edward", "Thai", "Condtioner"]
  @@male_options = ["Scones", "Kanye West", "Whiskey", "Bushwick", "Pugs", "Soup", "Team Jacob", "Chinese", "Shampoo"]
  def self.female_options
    @@female_options
  end
  def self.male_options
    @@male_options
  end
end
