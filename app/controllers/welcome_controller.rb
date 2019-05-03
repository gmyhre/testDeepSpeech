class WelcomeController < ApplicationController
  def index
  	@snippets = Snippet.where("id < ?", 5)

  end
end
