class IdeasController < ApplicationController

  before_filter :get_idea, :except => [:new, :index]

  def new
    @idea = Idea.new
  end

  def index
    @ideas = Idea.includes(:users)
  end

  def show
  end

  def participate
    @user = User.find(params[:user_id])
    IdeaUser.create(:idea_id => @idea.id, :user_id => current_user.id)
    @ideas = Idea.includes(:users)
  end

  private
  def get_idea
    @idea = Idea.find(params[:id])
  end
end
