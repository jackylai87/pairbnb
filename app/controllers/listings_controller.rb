class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	def index
		if params[:search].present?
			@listings = Listing.near(params[:search])
		elsif params.keys.any? {|key| key.to_s.match(/\b\d/)}
			@tag_array = []
			params.each do |key,value|
				if !!key.match(/\b\d/)
					@tag_array << value
				end
			end
			@listings = Listing.tagged_with(@tag_array, :any => true)
		else
			@listings = Listing.all
		end
	end

	def new
		@listing = Listing.new
	end

	def create
		# render plain: params[:listing].inspect
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing, notice: "Listed"
		else
			render 'new'
		end
	end

	def show
		@listings = Listing.all
		@comment = Comment.new
		@method = "post"
	end

	def update
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render :listing
		end
	end

	def destroy
		@listing.destroy
		redirect_to listings_path
	end

	def search
		respond_to do |format|
			# when the 'search' button is clicked
			format.html do
				@listings = Listing.search(params[:term], misspellings: {below: 5}, emoji: true)	
				if @listings.blank?
					@error = "No result is found"
				end
				render :template => "listings/index"
			end

			# when user key in things
			format.json do
				@location = Listing.search(params[:term], fields: ["location"], mispellings: {below: 5})
				@location = @location.map(&:location)
		
				render json: @location
			end
		end
	end

	private
		def listing_params
			params.require(:listing).permit(:title, :home_type, :room_type, :accomodate, :location, :latitude, :longitude, :description, :price, {images: []}, :remove_images, :remote_image_url, :tag_list)
		end

		def set_listing
			@listing = Listing.find(params[:id])
		end
end
