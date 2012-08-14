class ApplicationsController < ApplicationController
  before_filter :get_job

  def get_job
    @user = current_user
    @job = Job.find(params[:job_id]) if params[:job_id]
  end
  
  def index
    redirect_to all_applications_url
  end

  def all
    @user = current_user 
    @applications = @user.applications
    render :index
  end

  def interview
    @user = current_user
    @label = 'Interview'
    @applications = @user.applications.interview_only
    render :action => :index
  end

  def applied
    @user = current_user
    @label = 'Applied'
    @applications = @user.applications.applied_only
    render :action => :index
  end

  def declined
    @user = current_user
    @label = 'Declined'
    @applications = @user.applications.declined_only
    render :action => :index
  end

  def show        
    @application = Application.find(params[:id])
    @job = @application.job
    @profile = @application
    @user = @application.user
    @objective = true
  end
  
  def new    
    @application = Application.new
  end

  def edit  
    @application = Application.find(params[:id])    
  end

  def create
    @application = @job.applications.new(params[:application])
    if @application.save
      redirect_to user_applications_path(@user.username)
    else
      render action: 'new'
    end    
  end

  def update
    @application = Application.find(params[:id])
    @status = params[:status]    
    case @status
      when 'Declined'    
        @application.update_attributes(status: @status)
        Activity.create(:user_id => @application.user.id, :activity_type => 'application', :text => "#{@application.user.formatted_name} Your Application to <a href='/user/#{@application.user.username}/applications/#{@application.id}'>#{@application.job.job_title}</a> has been Declined.")
      when 'UnSuccessful'  
        @application.update_attributes(status: @status)
        Activity.create(:user_id => @application.user.id, :activity_type => 'application', :text => "#{@application.user.formatted_name} Your Interview to <a href='/user/#{@application.user.username}/applications/#{@application.id}'>#{@application.job.job_title}</a> was Unsuccessful.")
      when 'Hired'  
        @application.update_attributes(status: @status)
        Activity.create(:user_id => @application.user.id, :activity_type => 'application', :text => "#{@application.user.formatted_name} You've been Hired to <a href='/user/#{@application.user.username}/applications/#{@application.id}'>#{@application.job.job_title}</a> Congratulations.")         
      else            
        @application.update_attributes(params[:application])
    end  
    if @application.save
      redirect_to user_application_path(@user.username, @application)
    else
      render action: 'edit'
    end    
  end

  def destroy
    if params[:job_id]
      @application = current_user.applications.find_by_job_id(params[:job_id])    
    else
      @application = current_user.applications.find_by_job_id(params[:id])    
    end  
    @application.destroy
    flash[:notice] = "Removed Job Application."
    redirect_to jobs_path
  end
end
