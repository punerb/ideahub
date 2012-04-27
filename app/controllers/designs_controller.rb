class DesignsController < ApplicationController
  def index
    @idea = Idea.first
  end
end
