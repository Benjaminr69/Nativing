class FavoriteUsersController < ApplicationController
  before_action :set_user
  
  def create
    if Favorite.create(favorited: @user, user: current_user)
      redirect_to @user, notice: 'Project has been favorited'
    else
      redirect_to @user, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @user.id, user_id: current_user.id).first.destroy
    redirect_to @user, notice: 'Project is no longer in favorites'
  end
  
  private
  
  def set_user
    @user = Project.find(params[:user_id] || params[:id])
  end
end