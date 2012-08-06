class BlocksController < ApplicationController
  def index
    @user = current_user
    @blocked_jobs = @user.blocked_jobs    
  end

  def create    
    @blocked_job = current_user.blocks.build(:job_id => params[:job_id]) if current_user    
    if @blocked_job.save             
      redirect_to jobs_path
    else        
      redirect_to jobs_path
    end
  end

  def destroy
    @blocked_job = current_user.blocks.find(params[:id])
    @blocked_job.destroy    
    redirect_to jobs_path
  end
end
