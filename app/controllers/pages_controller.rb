class PagesController < ApplicationController

  def index
    @information = Information.first
    @albums = Album.all
    @message = Message.new
  end

  def edit
  end
  
end
