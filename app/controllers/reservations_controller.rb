class ReservationsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :create
	# respond_to :html, :js
	
	def show
		@reservation = Reservation.find(params[:id])
		@listing = Listing.find(params[:listing_id])
	end

	def edit
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	def new
		@listing = Listing.find(params[:listing_id])
		@client_token = generate_client_token
		@reservation = Reservation.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.new(reservation_params)
		price_per_night = @listing.price.to_i
		@reservation.amount = price_per_night * (Date.strptime(@reservation.check_out_date, '%m/%d/%Y') - Date.strptime(@reservation.check_in_date, '%m/%d/%Y')).to_i
		@reservation.user_id = current_user.id
		@customer = current_user
		@host = @listing.user
		if @reservation.valid?
			result = Braintree::Transaction.sale(
			  amount: @reservation.amount.to_i,
			  payment_method_nonce: params[:payment_method_nonce])
			if result.success?
				@reservation.save
				# flash[:booking_status] = "Booking has been made successfully, TQ."
				# respond_to do |format|
				# 	format.html { redirect_to @listing }
				# 	format.js
				# end
				ReservationJob.perform_later(@customer, @host, @listing.id, @reservation.id)
				redirect_to @listing
			else
				# flash[:booking_status] = "Booking Unsuccessful, please try again."
					respond_to do |format|
						format.html { redirect_to @listing }
						format.js
					end
			end
		end
	end

	def update
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
		if @reservation.update(reservation_params)
			redirect_to user_path(current_user.id)
		else
			render :listing
		end
	end

	def destroy
		flash[:destroy] = "Booking Cancelled Successfully"
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to user_path(current_user.id)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id)
	end

	def generate_client_token
		Braintree::ClientToken.generate
	end
end
