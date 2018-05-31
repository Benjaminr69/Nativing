class PostsController < ApplicationController
	before_action :logged_in?
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.paginate(page: params[:page])
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    if @post.save
      flash[:success] = "Annonce créée avec succès"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  	if @post.save
  		flash[:success] = "Annonce modifiée avec succès"
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post.destroy
  	flash[:success] = "Annonce supprimée avec succès"
  	redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:content, :user_id)
    end

    def find_post
    	@post = Post.find(params[:id])
    end
end