class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @buildings = Building.all
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path()
  end

  def new
    @booking = Booking.new
    @building = Building.find(params[:building_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @building = Building.find(params[:building_id])
    @booking.building = @building
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @booking = Booking.find(params[:id])
    # @booking.destroy
    # redirect_to bookings_path()
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :start_date, :end_date, :total_price)
  end

end
