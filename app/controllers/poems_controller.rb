class PoemsController < ApplicationController
  def index

    @poems = PoemApi.new.fetch_poems(params[:q])
  
  end
end
