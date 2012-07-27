class EducationsController < ApplicationController
  def new
    @user = current_user  
  	@education = Education.new
	  @profile = @user.profile
  end	
	
  def create 
  	@profile = current_user.profile
    @education = @profile.educations.create(params[:education])
    redirect_to user_profile_path(current_user.username)
  end	  
end
