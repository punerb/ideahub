class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_idea, :only => [:update, :edit, :show, :participate]

  def index
    @ideas = Idea.includes(:users).includes(:categories)
  end
  
  def create
    @idea = Idea.new(params[:idea])
    @idea.user = current_user
    if @idea.save
      flash[:notice] = 'Idea created successfully'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    if @idea.update_attributes(params[:idea])
      flash[:notice] = 'Idea updated'
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def participate
    if @idea.users.include?(current_user)
      flash[:error] = 'You are already participating this idea'
    else
      @idea.users << current_user
      User.tweet("@#{current_user.screen_name} has just participated to '#{@idea.title}'")
    end
  end

  private
  def get_idea
    @idea = Idea.find_by_id(params[:id])
    @idea || invalid_url!
  end
end
