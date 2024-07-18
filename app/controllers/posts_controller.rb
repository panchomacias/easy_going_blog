class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated succesfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post succesfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, alert: 'Post succesfully deleted', status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :status)
  end
end
