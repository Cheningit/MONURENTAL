class BookingsController < ApplicationController
  require 'open-uri'
  require 'cgi'

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
    @info = Booking.find(params[:id])
    pdf = Prawn::Document.new
    pdf.text text(@info)

    # image_path = Rails.root.join('app/assets/images/QR1.jpeg')
    # sanitized_path = File.expand_path(image_path)
    # image_data = File.open(sanitized_path, 'rb') { |file| file.read }
    # pdf.image(image_data, width: 200)  # Adjust the width as needed


    send_data(pdf.render,
      filename: 'reservation.pdf',
      type: 'application/pdf')
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :start_date, :end_date, :total_price)
  end

  def text(booking)
    "Subject: Reservation Confirmation

    Dear Customer,

    We are pleased to confirm your reservation with Monumental. Below are the details of your reservation:

    Reservation Details:

    Reservation ID: #{booking.id}
    Reservation Date: #{booking.created_at}
    Start Date: #{booking.start_date}
    End Date: #{booking.end_date}
    Duration: #{(booking.end_date - booking.start_date).to_i} days
    Total Cost: #{sprintf('£%.2f', booking.total_price).gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')}
    Please note the following terms and conditions for your reservation:

    Payment: A deposit of £2,500,000 is required to secure your reservation. The remaining balance is due on or before the start date of the reservation.
    Cancellation Policy: In case of cancellation, please notify us at least 14 days days in advance. Cancellations made within 7 days of the reservation start date may be subject to a cancellation fee of 10% of total fee.
    Check-in/Check-out: Check-in time is at 09:00 Local Time on the start date of the reservation. Check-out time is at 13:00 on the end date of the reservation. Late check-outs may incur additional charges.
    If you have any questions or need further assistance, please feel free to contact us at +33 3033 3033 or rental@monurental.com. We look forward to hosting you and ensuring a memorable experience.

    Thank you for choosing Monumental. We appreciate your business!

    Sincerely,
    A Monurental Team"
  end
end
