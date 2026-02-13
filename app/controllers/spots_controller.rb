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

    respond_to do |format|
      if @spot.save
        created_spot = @spot
        @spot = Spot.new
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("spot_form", partial: "spots/form", locals: { spot: @spot }),
            turbo_stream.update("spot_result", partial: "spots/spot_result", locals: { spot: created_spot })
          ]
        end
        format.html do
          @created_spot = created_spot
          render :new, status: :ok
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("spot_form", partial: "spots/form", locals: { spot: @spot })
        end

        format.html { render "spots/new", status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @spot
  end

  def update
    authorize @spot

    respond_to do |format|
      if @spot.update(spot_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("spot_form", partial: "spots/form", locals: { spot: @spot }),
            turbo_stream.update("spot_result", partial: "spots/spot_result", locals: { spot: @spot })
          ]
        end
        format.html { redirect_to @spot, notice: "Spot updated." }

      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "spot_form",
            partial: "spots/form",
            locals: { spot: @spot }
          )
        end

        format.html { render :edit, status: :unprocessable_entity }
      end
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
