class LikesController < ApplicationController
  before_action :require_authentication
  before_action :set_spot

  def create
    @like = @spot.likes.new(user: current_user)
    authorize @like

    if @like.save
      redirect_to @spot, notice: "Liked this spot."
    else
      redirect_to @spot, alert: "Unable to like this spot."
    end
  end

  def destroy
    @like = @spot.likes.find(params[:id])
    authorize @like
    @like.destroy
    redirect_to @spot, notice: "Like removed."
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
