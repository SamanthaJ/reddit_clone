class PostsController < ApplicationController
  before_filter :authenitcate_user!, except: :index

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user_posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:link)
  end
end
