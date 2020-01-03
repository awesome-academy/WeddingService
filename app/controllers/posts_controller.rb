class PostsController < ApplicationController
  before_action :get_post, only: %i(show edit)

  def index
    @post = Post.all.latest
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      redirect_to root_path
    end
  end

  def show
  end

  private
  def get_post
    @post = Post.find_by id: params[:id]
    return if @post
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit :title, :description, :content, :image
  end
end
