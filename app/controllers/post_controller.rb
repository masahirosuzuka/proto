class PostController < ApplicationController
  def new
    @post = Post.new
    @post.user_id = params[:user_id]
    @post.title = params[:title]
    @post.body = params[:body]
    @post.link = params[:link]
    @post.save

    redirect_to profiles_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to profiles_url
  end
end
