class User < ApplicationRecord
  has_secure_password
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :plants
  @@female_options = ["Muffins", "Drake", "Vodka", "Williamsburg", "Poodles", "Salad", "Team Edward", "Thai", "Condtioner"]
  @@male_options = ["Scones", "Kanye West", "Whiskey", "Bushwick", "Pugs", "Soup", "Team Jacob", "Chinese", "Shampoo"]
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :username, presence:true, uniqueness:true
  #should take a plant variable to associate with
  def add_user_actions
    Action.all.each do |action|
      UserAction.create(user: self, action: action)
    end
  end

  def self.female_options
    @@female_options
  end

  def self.male_options
    @@male_options
  end


end
