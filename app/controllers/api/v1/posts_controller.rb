class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  def index
    posts = Post.all.order(created_at: :desc)
    render status: 200, json: posts
  end

  def show
    render status: 200, json: @post
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.create(post_params)
    if post
      render status: 200, json: post
    else
      render status: 400, json: {data: post.errors}
    end
  end

  def update
    if @post.update(post_params)
      render status: 200 , json: @post
    else
      render status: 400, json: {data: @post.errors}
    end
  end

  def destroy
    if @post.destroy
      render status: 200 , json:{data: @post}
  else
      render status: 400 , json:{ data: @post.errors}
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end
end
