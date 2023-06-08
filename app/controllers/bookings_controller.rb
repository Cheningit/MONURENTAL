class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)

    # @bookings_owner = Booking.where("building.user" => current_user)
    @bookings_owner = Booking.joins(:building).where(buildings: { user: current_user })
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def new
    @booking = Booking.new
    @building = Building.find(params[:building_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @building = Building.find(params[:building_id])
    @booking.building = @building
    @booking.total_price = ((@booking.end_date - @booking.start_date) * @building.price).to_i
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  # def destroy
  #   @booking.destroy
  #   redirect_to bookings_path
  # end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :start_date, :end_date, :total_price)
  end

end
