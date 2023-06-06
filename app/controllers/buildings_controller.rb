class BuildingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user
    if @building.save
      redirect_to buildings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def building_params
    params.require(:building).permit(:name, :address, :beds, :price, :availability)
  end
end
