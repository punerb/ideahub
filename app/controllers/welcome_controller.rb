class WelcomeController < ApplicationController

  def index
<<<<<<< HEAD
    @idea= Idea.first
=======
    @ideas = Idea.limit(4).includes(:categories)
>>>>>>> e21cc7e9e1b41ef5d0771ac939f918075771a133
  end

end
