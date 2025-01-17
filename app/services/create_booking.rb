class CreateBooking < Service
  def initialize(bike_id:, date:, user_full_name:)
    @bike = Bike.find(bike_id)
    @date = date
    @user_full_name = user_full_name
  end

  def run
    booking = Booking.new(
      bike_id: @bike.id,
      date: @date,
      user_full_name: @user_full_name,
    )

    if booking.valid? && booking_available? && bike_available?
      booking.save
      booking
    else
      booking.errors.add(:date, "is not available for this bike")
      booking
    end
  end

  private

  def booking_available?
    @bike.bookings.on_date(@date).empty?
  end

  def bike_available?
    @bike.unavailabilities.find_by(date: @date).blank?
  end
end
