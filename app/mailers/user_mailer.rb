class UserMailer < ApplicationMailer
  default from: 'neoplants.test@gmail.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Neoplants')
  end
end
