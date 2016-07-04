class PostsController < ApplicationController
  def index
    @posts = Post.all
=begin
    @posts.each do |post|
      logger.info(post.title)     
    end
=end    
  end

  def show
    #binding.pry
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    #@user = User.new
  end

  def create
    post = Post.new(post_params)
    #user = User.new(user_params)

    #binding.pry
    


    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end


  def post_paramss
    #binding.pry
    params.require(:post).permit(:title, :content, category_ids: [])
   
  end

end
