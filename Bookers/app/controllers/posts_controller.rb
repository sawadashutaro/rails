class PostsController < ApplicationController
  def index

  	@post = Post.new

  	@posts = Post.all

  end

  def show

  	@post = Post.find(params[:id])

  end

  def new
  end

  def create

  	post = Post.new(post_params)

  	post.save

  	redirect_to post_path(post.id), notice:"Book was successfully created."

  end

  def edit

  	@post = Post.find(params[:id])

  end

  def update

  	post = Post.find(params[:id])

  	post.update(post_params)

  	redirect_to post_path(post.id), notice:"Book was successfully updated."

  end

  def destroy

  	post = Post.find(params[:id])

  	post.destroy

  	redirect_to posts_path, notice:"Book was successfully destroyed."

  end

  private

  def post_params

  	params.require(:post).permit(:titile, :body)

  end

end
