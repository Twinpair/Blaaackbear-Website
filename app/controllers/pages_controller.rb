class PagesController < ApplicationController

  def index
    @information = Information.first
  end

  def edit
  end
  
end
