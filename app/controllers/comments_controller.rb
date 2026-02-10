class CommentsController < ApplicationController
  before_action :require_authentication
  before_action :set_spot

  def create
    @comment = @spot.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    if @comment.save
      redirect_to @spot, notice: "Comment added."
    else
      flash.now[:alert] = "Unable to save comment."
      render "spots/show", status: :unprocessable_entity
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
