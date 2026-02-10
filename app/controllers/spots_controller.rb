class SpotsController < ApplicationController
  include Pagy::Backend

  before_action :require_authentication, except: %i[index show]
  before_action :set_spot, only: %i[show edit update destroy]

  def index
    @pagy, @spots = pagy(Spot.order(created_at: :desc))
  end

  def show
    @comment = Comment.new
    @like = current_user&.likes&.find_by(spot: @spot)
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = current_user.spots.new(spot_params)
    authorize @spot

    if @spot.save
      redirect_to @spot, notice: "Spot created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @spot
  end

  def update
    authorize @spot

    if @spot.update(spot_params)
      redirect_to @spot, notice: "Spot updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @spot
    @spot.destroy
    redirect_to spots_path, notice: "Spot deleted."
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :description, :city, :state, :status)
  end
end
