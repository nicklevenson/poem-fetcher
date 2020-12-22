class PoemsController < ApplicationController
  def index

    @poems = PoemApi.new.scrape_poems(params[:q])
    
  end
end
