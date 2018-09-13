class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if !@user.plants.empty?
        if @user.passed_tutorial
          @user.plants.each do |plant|
            if plant.hp > 1
              hp = plant.hp - 1
              #10% chance of catching an ailment
              # if 1 + rand(10) == 5
              #for testing purposes
              if 5 == 5
                ailment = Ailment.all.sample
                if ailment.ailment_type == "Knocked Over"
                  sp = plant.soil_points - 1
                  plant.update(soil_points:sp)
                end
                plant.update(ailment:ailment)
              end
              plant.update(hp:hp)
            elsif plant.hp == 1
              plant.destroy
              redirect_to '/plants/death'
              return
            end
          end
          redirect_to '/plants/plant_homepage'
        else
          redirect_to "/plants/seed"
        end
      else
        redirect_to '/personality_quiz' if !@user.passed_tutorial
        redirect_to '/plants/new' if @user.passed_tutorial
      end
    else
      redirect_to '/login'
    end
  end
  def destroy
    session.delete :user_id
    #maybe have to redirect to a general homepage later
    redirect_to '/'
  end
end
