class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  	@photos = Photo.all.order('created_at DESC')
  end

  def show
  end

  def new
  	@photo = current_user.photos.build
  end

  def create
  	@photo = current_user.photos.build(photo_params)

  	if @photo.save
  		redirect_to photo_path(@photo)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	@photo.update(photo_params)
  	redirect_to photo_path(@photo)
  end

  def destroy
  	@photo.destroy
  	redirect_to photos_path
  end

  private
  def set_photo
  	@photo = Photo.find(params[:id])
  end

  def photo_params
  	params.require(:photo).permit(:pic, :description, :avatar)
  end

end
