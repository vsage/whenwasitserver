class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end
  #http://guides.rubyonrails.org/getting_started.html#generating-a-model
end
