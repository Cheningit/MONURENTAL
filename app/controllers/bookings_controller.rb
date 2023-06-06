class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path()
  end

  def edit
    # @booking = Booking.find(params[:id])
    # @booking.destroy
    # redirect_to bookings_path()
  end

  # private

  # def booking_params
  #   params.require(:booking).permit(:status, :date)
  # end

end
