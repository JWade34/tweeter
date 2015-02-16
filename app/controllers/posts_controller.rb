class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC").page params[:page]
    @users = User.all
    @timeline = Post.timeline(@current_user).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:body)
    @post.user = @current_user
    if @post.save
      redirect_to root_path, notice: "so whatcha watcha watcha want..."
    else
      render :new
    end
  end

end
