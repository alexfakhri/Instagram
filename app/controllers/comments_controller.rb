class CommentsController < ApplicationController

	def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_param)
  	redirect_to "/posts/#{@post.id}"
  	
  end

  def comment_param
  	params.require(:comment).permit(:comment)
  end
end