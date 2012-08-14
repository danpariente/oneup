class IdentifiersController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile  
    @identifier = Identifier.new
  end 
  
  def create 
    @profile = current_user.profile
    @identifier = @profile.identifiers.create(params[:identifier])
    redirect_to edit_user_profile_path(current_user.username)
  end   
end
