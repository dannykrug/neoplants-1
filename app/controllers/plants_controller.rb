class PlantsController < ApplicationController
  before_action :require_login

  def seed
    @plant = current_user.plants.first
  end


  def personality
  end

  def create_personality
    #based on information given by personality personality_quiz
    #assign person to certain plant
    # byebug
    masc = 0
    fem = 0
    answers = params[:answers]
    answers.each do |key, answer|
      if User.female_options.include?(answer)
        fem += 1
      else
        masc += 1
      end
    end
    if fem > masc
      plant_type = PlantType.find_by(name: "Rose")
    else
      plant_type = PlantType.find_by(name: "Cactus")
    end
    @plant = Plant.create(user: User.find(session[:user_id]), name: params[:plant_name], water_points: 1, soil_points: 1, hp:1, state: State.find_by(name: "Seedling", plant_type: plant_type))
    redirect_to plants_seed_path
  end

  private

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end
end
