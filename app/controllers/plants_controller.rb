class PlantsController < ApplicationController
  before_action :require_login




  def death
  end
  def show
    current_user.update(passed_tutorial:true)
    @plant = Plant.find(params[:id])
    @plant_type = @plant.state.plant_type
    @state = @plant.state

    @filled_hp = @plant.hp
    @empty_hp = @state.max_hp - @filled_hp

    @filled_water_points = @plant.water_points
    @empty_water_points = @state.water_need - @filled_water_points

    @filled_soil_points = @plant.soil_points
    @empty_soil_points = @state.soil_need - @filled_soil_points

    #maybe have a random number picker that picks when a plant will randomly get
    #hit with an ailment, randomize from list of ailments
    @ailment = @plant.ailment
  end

  def index
    @plants = current_user.plants
    # render :plant_homepage
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
    @plant = Plant.create(user: current_user, name: params[:plant_name], state: State.find_by(name: "Seedling", plant_type: plant_type))
    #need to bind useractions to that plant
    current_user.add_user_actions
    # @user = User.find(session[:user_id])

    current_user.save
    redirect_to plants_seed_path
  end

  def actions
    @plant = Plant.find(params[:id])
    @action_name = Action.find(params[:action_id]).name
    @ailment = @plant.ailment
    #can add else statement flash message pop up "That didn't work try again"
    if @action_name == "Add Soil" && @plant.soil_points < @plant.state.soil_need
      #verify that it doesn't max out later
      soil_points = @plant.soil_points + 1
      @plant.update(soil_points:soil_points)
    elsif @action_name == "Add Water" && @plant.water_points < @plant.state.water_need
      water_points = @plant.water_points + 1
      @plant.update(water_points:water_points)
    elsif @action_name == "Move to Sunlight" && @ailment && @ailment.action.name == @action_name
      @plant.update(ailment_id:nil)
    elsif @action_name == "Shout" && @ailment && @ailment.action.name == @action_name
      @plant.update(ailment_id:nil)
    elsif @action_name == "Whisper Sweet Nothings & Stroke the Leaves" && @ailment && @ailment.action.name == @action_name
      @plant.update(ailment_id:nil)
    elsif @action_name == "Whisper Sweet Nothings & Stroke the Leaves" && @plant.hp < @plant.state.max_hp
      hp = @plant.hp + 1
      @plant.update(hp:hp)
    else
      puts "That action #{@action_name} didn't work! Try again"
    end
    ##check to see if plant is ready for evolution, if it is i need to change plant state, and
    #all plant attributes
    redirect_to @plant
  end


  private

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def plant_params
    params.require(:plant).permit(:name, :state_id, :action)
  end
end
