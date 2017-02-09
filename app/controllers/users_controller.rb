class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Instagram, Bruh!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem with creating your account.  Please try again"
      redirect_to :back
    end
  end
  def edit

  end
  def update
    @user = current_user
    @user.update(user_edit_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def destroy
    @user = current_user
    @user.photos.each do |p|
      p.destroy
    end
    @user.comments.each do |p|
      p.destroy
    end
    @user.destroy
    redirect_to "/log-out"
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_edit_params
    params.require(:user).permit(:name, :description, :avatar)
  end
end
