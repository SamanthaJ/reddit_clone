class PostsController < ApplicationController
  before_filter :authenitcate_user!, except: [:index]

  def index
    @posts = Posts.all
    @post = Post.new
  end
  
end
