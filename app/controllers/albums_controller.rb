class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.order_listed = Album.count + 1 if @album.order_listed.nil? 
    if @album.save
      Album.increment_order(@album.id, @album.order_listed)
      redirect_to album_path(@album.id, edit: true)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @information = Information.first
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    # Save order_listed attribute to update accoridingly later
    cache_order_listed = @album.order_listed
    if @album.update(album_params)
      @album.order_listed = Album.count + 1 if @album.order_listed.nil? 
      # Don't increment other order_listed attributes if order_listed is the same on the one being updated
      Album.increment_order(@album.id, @album.order_listed) if cache_order_listed != @album.order_listed
      redirect_to album_path(@album.id, edit: true)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
  end

private

  def album_params
    params.require(:album).permit(:name, :description, :cover_image, :order_listed)
  end

end
