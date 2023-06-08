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

  def download
    pdf = Prawn::Document.new
    pdf.text text()
    send_data(pdf.render,
      filename: 'reservation.pdf',
      type: 'application/pdf')
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :start_date, :end_date, :total_price)
  end

  def text
    "Subject: Reservation Confirmation

    Dear Customer,

    We are pleased to confirm your reservation with Monumental. Below are the details of your reservation:

    Reservation Details:

    Reservation ID: [Reservation ID]
    Reservation Date: [Reservation Date]
    Start Date: [Start Date]
    End Date: [End Date]
    Duration: [Duration]
    Reserved [Item/Service]: [Item/Service Name]
    Total Cost: [Total Cost]
    Please note the following terms and conditions for your reservation:

    Payment: A deposit of [Deposit Amount] is required to secure your reservation. The remaining balance of [Remaining Balance] is due on or before the start date of the reservation.
    Cancellation Policy: In case of cancellation, please notify us at least [Cancellation Notice Period] days in advance. Cancellations made within [Cancellation Penalty Period] days of the reservation start date may be subject to a cancellation fee of [Cancellation Fee Amount].
    Check-in/Check-out: Check-in time is at [Check-in Time] on the start date of the reservation. Check-out time is at [Check-out Time] on the end date of the reservation. Late check-outs may incur additional charges.
    If you have any questions or need further assistance, please feel free to contact us at [Phone Number] or [Email Address]. We look forward to hosting you and ensuring a memorable experience.

    Thank you for choosing Monumental. We appreciate your business!

    Sincerely,"
  end
end
