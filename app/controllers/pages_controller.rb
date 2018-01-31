class PagesController < ApplicationController

  def index
    @information = Information.first
    @albums = Album.all
  end

  def edit
  end
  
end
