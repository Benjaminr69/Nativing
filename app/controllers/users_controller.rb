class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

  def first; end
  def second; end
  def third; end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Merci de consulter vos mails et de cliquer sur le lien d'activation."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @availabilities = Availability.all
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profil mis à jour"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @filterrific = initialize_filterrific(
      User,
      params[:filterrific]
      #persistence_id: 'shared_key',
      #default_filter_params: {},
      #available_filters: [],
    ) or return
    @users = @filterrific.find.page(params[:page])

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to users_url
  end

  def coach
    user = User.find(params[:user_id])
    user.update(coach: params[:coach])
    redirect_to users_url
  end

  def start_time
    self.my_related_model.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  private

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password,
                                   :password_confirmation, :photo, :birthdate, :mother_tongue, :coach, :phone, :street_number, :locality, :route, :administrativearea_level_1, :country, :postal_code, spoken_language_ids:[])
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Merci de vous connecter."
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
