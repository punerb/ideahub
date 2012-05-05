class WelcomeController < ApplicationController

  def index
    @idea_quote = get_idea_quote
    @ideas = Idea.limit(4).includes(:categories)
  end

  def get_idea_quote
    idea_quote = IDEA_SET[rand(IDEA_SET.size)]
  end

end
