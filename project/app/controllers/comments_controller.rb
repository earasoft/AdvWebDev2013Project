class CommentsController < ApplicationController
  def create
    @post = Post.find_by_unique_id(params[:post_id])
    if @post
      @post
      @comment = @post.comments.create(params[:comment])
      redirect_to post_path(@post)
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the post' }
    end
  end
end
