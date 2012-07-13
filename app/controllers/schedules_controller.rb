class SchedulesController < ApplicationController
  before_filter :is_admin?
  before_filter :get_idea
  before_filter :get_schedule, :only => [:edit, :update, :destroy]

  def index
    @schedules = @idea.schedules
  end

  def new
    @schedule = @idea.schedules.new
    @s_date = Date.today
  end

  def create
    @schedule = @idea.schedules.new(params[:schedule])
    if @schedule.save
      @schedule.idea.users.each do |p|
        User.tweet("@#{p.screen_name}, do come to #{@schedule.location}. We're hacking on '#{@schedule.idea.title}' on #{@schedule.scheduled_at.idea_date} at 5.30pm. #{idea_url(@schedule.idea)}")
      end
      redirect_to idea_schedules_url(@idea)
    else
      @s_date = Date.today
      render :action => 'new'
    end
  end

  def update
    @schedule.attributes = params[:schedule]
    if @schedule.save
      redirect_to idea_schedules_url(@idea)
    else
      render :action => 'edit'
    end
  end

  def destroy
    unless @schedule.scheduled_at > DateTime.now and @schedule.destroy
      redirect_to idea_schedules_url(@idea, @schedule)
    end
  end

  private

  def get_idea
    @idea = Idea.find_by_id(params[:idea_id])
  end
  
  def get_schedule
    @schedule = Schedule.find_by_id(params[:id])
    @s_date = @schedule.scheduled_at
    @schedule || invalid_url!
  end

end
