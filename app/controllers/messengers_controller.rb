class MessengersController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile  
    @messenger = Messenger.new
  end 
  
  def create 
    @profile = current_user.profile
    @messenger = @profile.messengers.create(params[:messenger])
    redirect_to edit_user_profile_path(current_user.username)
  end 
end
