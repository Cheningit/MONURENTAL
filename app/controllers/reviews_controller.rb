class ReviewsController < ApplicationController

  def create
    @building = Building.find(params[:building_id])
    @review = Review.new(review_params)
    @review.building = @building
    if @review.save!
      redirect_to building_path(@building.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to building_path(@review.building), status: :see_other
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

end
