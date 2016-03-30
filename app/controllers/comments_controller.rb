class CommentsController < ApplicationController
  def create
    @fighter = Fighter.find(params[:fighter_id])
    @comment = @fighter.comments.build(comment_params) # strong parameters
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Comment posted.'
          redirect_to @post
        end
        format.js
      end
    else
      render @fighter
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @fighter = @comment.fighter
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment deleted.'
        redirect_to @fighter
      end
      format.js
    end
  end
end
