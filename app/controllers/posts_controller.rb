class PostsController < ApplicationController
	before_action :logged_in?
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.paginate(page: params[:page])
  end

  def show
    @post_attachments = @post.post_attachments.all
  end

  def new
  	@post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def create
  	@post = Post.new(post_params)
    if @post.save
      params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @post.post_attachments.create!(:avatar => a, :post_id => @post.id)
      end
      flash[:success] = "Annonce créée avec succès"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  	if @post.save(post_params)
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
      params.require(:post).permit(:content, :user_id, :price, post_attachments_attributes: 
  [:id, :post_id, :avatar])
    end

    def find_post
    	@post = Post.find(params[:id])
    end
end