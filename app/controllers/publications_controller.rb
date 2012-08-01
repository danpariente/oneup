class PublicationsController < ApplicationController
  def new
    @user = current_user  
    @publication = Publication.new
    @profile = @user.profile
  end 
  
  def create 
    @profile = current_user.profile
    @publication = @profile.publications.create(params[:publication])
    redirect_to user_profile_path(current_user.username)
  end   
end
