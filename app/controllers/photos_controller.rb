class PhotosController < ApplicationController

  before_filter :set_album

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params)
    @photo.order_listed = @album.photos.count + 1 if @photo.order_listed.nil? 
    if @photo.save
      Photo.increment_order(@photo.id, @photo.order_listed, @album.id)
      redirect_to album_path(@album, edit: true)
    else
      render :new
    end
  end

  def edit
    @photo = @album.photos.find(params[:id])
  end

  def update
    @photo = @album.photos.find(params[:id])
    # Save order_listed attribute to update accoridingly later
    cache_order_listed = @photo.order_listed
    cache_album_id = @photo.album_id
    if @photo.update(photo_params)
      @photo.order_listed = @album.photos.count + 1 if @photo.order_listed.nil? 
      @photo.save
      if cache_album_id != @photo.album_id || cache_order_listed != @photo.order_listed
        Photo.increment_order(@photo.id, @photo.order_listed, @photo.album_id)
      end
      redirect_to album_path(Album.find(@photo.album_id), edit: true)  
    else
      render :edit
    end
  end

  def destroy
    @photo = @album.photos.find(params[:id])
    Photo.decrement_order(@photo.id, @photo.order_listed, @album.id)
    @photo.destroy
    redirect_to album_path(@album, edit: true)
  end

private

  def photo_params
    params.require(:photo).permit(:image, :order_listed, :album_id)
  end

  def set_album
    @album = Album.friendly.find(params["album_id"])
  end

end
