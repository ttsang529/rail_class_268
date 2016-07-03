class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    #binding.pry
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def post_params
    binding.pry
    params.require(:post).permit(:title, :content, category_ids: [])
  end

end
