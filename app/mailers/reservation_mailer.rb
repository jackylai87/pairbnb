class ReservationMailer < ApplicationMailer
	def reservation_email(customer, host, listing_id, reservation_id)
		@url = listing_reservation_url(listing_id, reservation_id)
		@host = host
		@customer = customer
		mail(to: @customer.email, subject: "You have received a booking from #{@customer.name}")
	end
end
