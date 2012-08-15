class LanguagesController < ApplicationController
  def new
    @user = current_user
	  @profile = @user.profile
  	@language = Language.new
  end	
	
  def create 
  	@profile = current_user.profile
    @language = @profile.languages.create(params[:language])
    redirect_to candidate_user_profile_path(current_user.username)
  end	  
end
