class SchedulesController < ApplicationController
  before_filter :get_idea

  def index
    @schedules = @idea.schedules
  end

  def create
    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
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
