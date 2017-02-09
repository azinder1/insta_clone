class CommentsController < ApplicationController

  def new
    @user = current_user
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment[:user_id] = @user.id
    if @comment.save
      redirect_to user_photo_path(@user, @photo)
    else
      redirect_to photos_path
    end
  end


private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
