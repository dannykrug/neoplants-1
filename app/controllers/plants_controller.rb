class PlantsController < ApplicationController
  before_action :require_login

  def death
  end
  def show
    current_user.update(passed_tutorial:true)
    @plant = Plant.find(params[:id])
  end

  def index
    @plants = current_user.plants
    render :plant_homepage
  end

  def new
    @plant = Plant.new
    states = State.all
    @states = states.select {|state| state.name == "Seedling"}
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to @plant
    else
      redirect_to new_plant_path
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      redirect_to @plant
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @name = @plant.name
    @plant.destroy
    redirect_to plants_death_path
  end

  def seed
    #add water and soil actions to the user
    # @plant = Plant.find(params[:id])
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
    #create plant
    @plant = Plant.create(user: User.find(session[:user_id]), name: params[:plant_name], state: State.find_by(name: "Seedling", plant_type: plant_type))
    #need to bind useractions to that plant
    current_user.add_user_actions
    # @user = User.find(session[:user_id])

    current_user.save
    redirect_to plants_seed_path
  end


  private

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def plant_params
    params.require(:plant).permit(:name, :state_id)
  end
end
