class PostsController < ApplicationController
  def index
    #@posts = Post.all
    @posts= Post.all.sort_by{|x| x.total_votes }.reverse
=begin
    @posts.each do |post|
      logger.info(post.title)     
    end
=end    
  end

  def show
    #binding.pry
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
    #@user = User.new
  end

  def create
    post = Post.new(post_params)
    #user = User.new(user_params)
    post.user = current_user
    #binding.pry
    


    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end


  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    #binding.pry
    params.require(:post).permit(:title, :content, category_ids: [])
   
  end

   def vote
    @post = Post.find(params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:success] = 'Your vote was counted!'
    else
      flash[:error] = "You can only vote for #{@post.title} once!"
    end

    redirect_to :back
  end
end
