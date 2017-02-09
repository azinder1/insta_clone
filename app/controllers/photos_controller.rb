class PhotosController < ApplicationController



  def index
  end

  def show
  end

  def new
    @photo = Photo.new
    @user = current_user
  end

  def create
    @user = current_user
    @photo = @user.photos.create(photo_params)
    if @photo.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

private

  def photo_params
    params.require(:photo).permit(:picture, :description)
  end

end
