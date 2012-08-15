class ExperiencesController < ApplicationController
  def new
    @user = current_user  
  	@experience = Experience.new
	@profile = @user.profile
  end	
	
  def create 
  	@profile = current_user.profile
    @experience = @profile.experiences.create(params[:experience])
    redirect_to candidate_user_profile_path(current_user.username)
  end	  
end
