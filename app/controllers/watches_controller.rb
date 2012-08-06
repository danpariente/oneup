class WatchesController < ApplicationController
  
  def index
    @user = current_user
    @watched_jobs = @user.watched_jobs    
  end

  def create    
    @watched_job = current_user.watches.build(:job_id => params[:job_id]) if current_user    
    if @watched_job.save             
      redirect_to jobs_path
    else        
      redirect_to jobs_path
    end
  end

  def destroy
    @watched_job = current_user.watches.find(params[:id])
    @watched_job.destroy    
    redirect_to jobs_path
  end
end
