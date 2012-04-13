class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end
end
