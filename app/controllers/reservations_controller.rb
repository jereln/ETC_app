class ReservationsController < ApplicationController
  before_filter :not_logged_in!

  def index
    @reservations = Reservation.all
  end
end
