class WelcomeController < ApplicationController

  def index
    @idea_quote = get_idea_quote
    @ideas = Idea.limit(4).includes(:categories)
  end

end
