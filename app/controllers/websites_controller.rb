class WebsitesController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile  
    @website = Website.new
  end 
  
  def create 
    @profile = current_user.profile
    @website = @profile.websites.create(params[:website])
    redirect_to edit_user_profile_path(current_user.username)
  end   
end
