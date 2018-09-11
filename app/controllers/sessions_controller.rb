class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if !@user.plants.empty?
        if @user.passed_tutorial?
          @user.plants.each do |plant|
            plant.hp -= 1
            if plant.hp <= 0
              redirect_to plants_death_path
            end
          end
          redirect_to '/plant_homepage'
        else
          redirect_to '/plants/seed'
        end
      else
        redirect_to '/personality_quiz'
      end
    else
      redirect_to '/login'
    end
  end

  def plant_homepage
  end

  def destroy
    session.delete :user_id
    #maybe have to redirect to a general homepage later
    redirect_to '/'
  end
end
