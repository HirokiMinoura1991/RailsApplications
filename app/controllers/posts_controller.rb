class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
    
  def create
    if current_user.posts.create(post_params)
      flash[:notice] = 'Post was successfully created.'
    else
      flash[:error] = 'Something went wrong'
    end

    redirect_to :root
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  protected

  def post_params
    params.require(:post).permit(:body)
  end
end
