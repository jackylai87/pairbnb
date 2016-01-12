class ReservationJob < ActiveJob::Base
	queue_as :default

	def perform(customer_id, host_id, listing_id, reservation_id)
		@customer = customer_id
		@host = host_id
		@listing = listing_id
		@reservation = reservation_id
		ReservationMailer.reservation_email(@customer, @host, @listing, @reservation).deliver_now
	end
end