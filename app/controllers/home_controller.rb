class HomeController < ApplicationController
  def index
   @user = current_user
   @posts = Post.all.order('created_at desc').page params[:page]
  end
end
