class BuildingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  private

  def buildings_params
    params.require(:building).permit(:address, :name, :beds, :price, :availability, photos: [])
  end
end
