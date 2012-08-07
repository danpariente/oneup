class InterviewsController < ApplicationController
  before_filter :get_application

  def get_application
    @user = current_user
    @application = Application.find(params[:application_id]) if params[:application_id]
    @app_int_us = @application.interviews.where(interviewed_id: @user.id) if params[:application_id]
  end

  def show        
    @interview = Interview.find(params[:id])
    @application = @interview.application
    @profile = @interview
    @user = @interview.user
  end

  def index    
    @user_interviews = @user.interviews
    @application_interviews = @app_int_us
  end 
  
  def new    
    @interview = Interview.new
  end

  def edit  
    @interview = Interview.find(params[:id])    
  end

  def create
    @interviewed = User.find(params[:interview][:interviewed_id])
    @interview = @application.interviews.new(params[:interview])
    @application.update_attributes(status:'Interview')
    
    if @interview.save && @application.save
      @event = Event.create(name: "Interview #{@interview.job.job_title}", description: @interview.notes, venue: @interview.mode, event_date: @interview.date, event_time: @interview.time, invites: @interviewed.username, user_id: current_user.id)
      Pending.create(:pending_event => @event, :pending_user => @interviewed)
      current_user.send_message(User.find(params[:interview][:interviewed_id]), "Interview #{@interview.job.job_title}", params[:interview][:notes])
      Activity.create(:user_id => @application.user.id, :activity_type => 'application', :text => "#{@application.user.formatted_name} An <a href='/user/#{@application.user.username}/interviews/#{@interview.id}'>Interview</a> has been scheduled for <a href='/user/#{@application.user.username}/applications/#{@application.id}'>#{@application.job.job_title}</a> the job that you applied to.")      
      redirect_to @application
    else
      render action: 'new'
    end    
  end

  def update        
    @interview = Interview.find(params[:id])
    @interview.update_attributes(params[:interview])
    
    if @interview.save
      redirect_to user_interview_path(@user.username, @interview)
    else
      render action: 'edit'
    end    
  end

  def destroy
    @interview = current_user.interviews.find_by_application_id(params[:id])    
    @interview.destroy
    flash[:notice] = "Removed application interview."
    redirect_to applications_path
  end
end
