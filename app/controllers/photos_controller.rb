class PhotosController < ApplicationController



  def index
    @photos = Photo.all
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
    @comment = Comment.new
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
    @photo = Photo.find(params[:id])
    @user = @photo.user
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(edit_params)
    if @photo.save
      redirect_to user_path(@photo.user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @photo = Photo.find(params[:id])
    @photo.destroy
    @photo.comments.each do |p|
      p.destroy
    end
    redirect_to user_path(@user)
  end
private

  def photo_params
    params.require(:photo).permit(:picture, :description)
  end
  def edit_params
    params.require(:photo).permit(:description)
  end
  def comment_params
    params.require(:comment).permit(:text)
  end
end
