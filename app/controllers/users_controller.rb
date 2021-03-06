class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name = params[:user][:first_name] + " " + params[:user][:last_name]
    user_actions = []
    Action.all.each do |action|
      UserAction.create(user: @user, action:action)
    end
    @user.balance = 10
    if @user.valid?
      #give user ability to perform all actions
      @user.save
      flash[:notice] = "Successfully Signed Up for Neoplants"
      session[:user_id]= @user.id
      # UserMailer.with(user:@user).welcome_email.deliver_now
      #TO DO: associate user with actions
      redirect_to personality_quiz_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
  end
end
