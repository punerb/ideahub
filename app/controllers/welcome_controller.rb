class WelcomeController < ApplicationController

  def index
    @idea= Idea.first
  end

end
