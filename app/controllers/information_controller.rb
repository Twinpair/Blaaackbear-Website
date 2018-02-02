class InformationController < ApplicationController

  before_action :authenticate

  def index
    @information = Information.first
  end

  def edit
    @information = Information.first
  end

  def update
    @information = Information.find(params[:id])
    @information.update(information_params)
    redirect_to information_index_path
  end

private 

  def information_params
    params.require(:information).permit(:title, :headline, :name, :banner_image,
      :about_me, :about_image, :contact_image, :email, :phone, :instagram, 
      :twitter, :facebook, :linkedin)
  end

end
