class ReferencesController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile	
  	@reference = Reference.new
  end	
	
  def create 
  	@profile = current_user.profile
    @reference = @profile.references.create(params[:reference])
    redirect_to candidate_user_profile_path(current_user.username)
  end	  
end
