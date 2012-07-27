class PreferencesController < ApplicationController
  
  def new
    @user = current_user   
    @profile = @user.profile
  	@preference = Preference.new
  end	
	
  def create 
  	@profile = current_user.profile
    @preference = @profile.create_preference(params[:preference])
    redirect_to user_profile_path(current_user.username)
  end	  
		
end
