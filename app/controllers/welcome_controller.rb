class WelcomeController < ApplicationController

  def index
    @ideas = Idea.limit(4).includes(:categories)
  end

end
