class UsersController < ApplicationController
  def new
  	@titre = "Inscription"
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bienvenue sur Nativing"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password,
                                   :password_confirmation)
    end
end
