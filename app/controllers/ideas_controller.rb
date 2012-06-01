class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_idea, :only => [:update, :edit, :show, :participate, :not_interested]

  def show
    redirect_to ideas_path 
  end

  def index
    @ideas = Idea.includes(:users).includes(:categories)
  end

  def new 
    @schedule = @idea.schedule.new
  end

  def create
    @idea = Idea.new(params[:idea])
    params[:cat] and params[:cat].each { |cat| @idea.categories << Category.find_or_create_by_name(cat) }

    @idea.user = current_user
    if @idea.save
      User.tweet "@#{current_user.screen_name} just had an idea \"#{@idea.title}\". Help him! #{ideas_url}"
      flash[:notice] = 'Idea created successfully'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # param[:category_ids] will always be empty, so when we call update_attributes, they will be
  # reset. Hence I have intentionally updated categories in both cases to ensure that 
  # they get updated only once!
  def update
    if @idea.update_attributes(params[:idea])
      params[:cat].each { |cat| @idea.categories << Category.find_or_create_by_name(cat) }
      flash[:notice] = 'Idea updated'
      redirect_to :action => :index
    else
      params[:cat].each { |cat| @idea.categories << Category.find_or_create_by_name(cat) }
      render :action => :edit
    end
  end

  def participate
    if @idea.users.include?(current_user)
      flash[:error] = 'You are already participating this idea'
    else
      @idea.users << current_user
      User.tweet("@#{current_user.screen_name} is helping out with '#{@idea.title}'. Are you? #{idea_url(@idea)}")
    end
  end

  def not_interested
    idea_user = IdeaUser.where(:user_id => current_user.id, :idea_id => @idea.id).first
    idea_user.destroy unless idea_user.nil?
  end

  private
  def get_idea
    @idea = Idea.find_by_id(params[:id])
    @idea || invalid_url!
  end
end
