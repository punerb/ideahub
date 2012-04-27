class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_idea, :only => [:update, :edit, :show, :participate]

  def index
    @ideas = Idea.includes(:users)
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
    @user = User.find(params[:user_id])
    IdeaUser.create(:idea_id => @idea.id, :user_id => current_user.id)
    @ideas = Idea.includes(:users)
  end

  private
  def get_idea
    @idea = Idea.find_by_id(params[:id])
    @idea || invalid_url!
  end
end
