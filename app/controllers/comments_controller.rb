class CommentsController < ApplicationController
  protect_from_forgery except: :create
  def create
    @comment = Comment.new params.permit(:body)
    @comment.owner = current_user
    @comment.posted_on = Time.now
    @comment.article_id = params[:article_id]
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        render :error
      end
    end
  end
end