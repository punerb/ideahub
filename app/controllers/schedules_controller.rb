class SchedulesController < ApplicationController
  before_filter :get_idea

  def index
    @schedules = @idea.schedules
  end

  def create
    @schedule = @idea.schedules.new(params[:schedule])
    if @schedule.save
      @schedule.idea.users.each do |p|
        User.tweet("@#{p.screen_name}, do come to #{@schedule.location}. We're hacking on '#{@schedule.idea.title}' on #{@schedule.scheduled_at.idea_at}. #{idea_url(@schedule.idea)}")
      end
      redirect_to idea_schedules_url(@idea)
    else
      render :action => 'new'
    end
  end

  private

  def get_idea
    @idea = Idea.find_by_id(params[:idea_id])
  end

end
