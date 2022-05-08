class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]

    mail to: @user.email
  end
end
