class AddressesController < ApplicationController
  def new
    @user = current_user
    @profile = @user.profile  
    @address = Address.new
  end 
  
  def create 
    @profile = current_user.profile
    @address = @profile.addresses.create(params[:address])
    redirect_to edit_user_profile_path(current_user.username)
  end   
end
