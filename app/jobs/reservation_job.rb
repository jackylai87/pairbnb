class ReservationJob < ActiveJob::Base
	queue_as :default

	def perform(customer, host, listing, reservation)
		@customer = customer
		@host = host
		@listing = listing
		@reservation = reservation
		ReservationMailer.reservation_email(@customer, @host, @listing, @reservation).deliver_now
	end

	def perform(customer, host, listing, reservation)
		@customer = customer
		@host = host
		@listing = listing
		@reservation = reservation
		ReservationMailer.reservation_notification(@customer, @host, @listing, @reservation).deliver_now
	end
end