class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    if @post
      @post
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the post' }
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by_id(params[:id])
    if @post
      @post
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the post' }
    end

  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post
      @post
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the post' }
    end

    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post
      @post
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the post' }
    end

    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end



