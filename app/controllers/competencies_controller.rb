class CompetenciesController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile	
  	@competency = Competency.new
  end	
	
  def create 
  	@profile = current_user.profile
    @competency = @profile.competencies.create(params[:competency])
    redirect_to user_profile_path(current_user.username)
  end	  
end
