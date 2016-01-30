class ReservationMailer < ApplicationMailer
	def reservation_email(customer, host, listing, reservation)
		@listing = listing
		@reservation = reservation
		@url = listing_reservation_url(listing.id, reservation.id)
		@host = host
		@customer = customer
		mail(to: @customer.email, subject: "Thank you for your booking in PairBnB from #{@host.name}")
	end

	def reservation_notification(customer, host, listing, reservation)
		@listing = listing
		@reservation = reservation
		@url = listing_reservation_url(listing.id, reservation.id)
		@host = host
		@customer = customer
		mail(to: @host.email, subject: "You have received a booking in PairBnB from #{@host.name}")
	end
end
