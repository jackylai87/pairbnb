class ListingsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index, :search]
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
	before_filter :require_permission, only: [:edit, :update, :destroy]

	def index
		if params[:search].present?
			@listings = Listing.near(params[:search]).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
		elsif params.keys.any? {|key| key.to_s.match(/\b\d/)}
			@tag_array = []
			params.each do |key,value|
				if !!key.match(/\b\d/)
					@tag_array << value
				end
			end
			@listings = Listing.tagged_with(params.first(99999), :any => true).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
		elsif params[:tag]
			@listings = Listing.tagged_with(params[:tag], :any => true).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
		else
			@listings = Listing.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
		end
	end

	def new
		@listing = Listing.new
	end

	def create
		# render plain: params[:listing].inspect
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			Listing.reindex
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
			Listing.reindex
			redirect_to @listing
		else
			render "new"
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
				@listings = Listing.search(params[:term], misspellings: {below: 5}, emoji: true, page: params[:page], per_page: 3)
				if @listings.blank?
					@error = "No result is found"
				end
				render :template => "listings/index"
			end

			# when user key in things
			format.json do
				@location = Listing.search(params[:term], fields: ["city_state", "country", "location", "title"], mispellings: {below: 5})
				@location = @location.map(&:city_state).uniq
				
				render json: @location
			end
		end
	end

	private
		def listing_params
			params.require(:listing).permit(:title, :home_type, :room_type, :accomodate, :location, :latitude, :longitude, :description, :price, 
				{images: []}, :remove_images, :remote_image_url, :tag_list, :main_image, :sub_image_one, :sub_image_two, :remove_main_image, :remove_sub_image_one, :remove_sub_image_two, :country, :city_state)
		end

		def set_listing
			@listing = Listing.find(params[:id])
		end

		def require_permission
			if current_user != Listing.find(params[:id]).user
				redirect_to @listing, notice: "You do not have permission to do this!"
			end
		end
end
