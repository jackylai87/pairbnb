class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@listing = Listing.find(params[:listing_id])
		@comment = @listing.comments.create(comment_params)
		if @comment.save
			redirect_to listing_path(@listing), notice: "Thank you for your comment."
		else
			redirect_to listing_path(@listing), notice: "Comment failed, please type something to comment."
		end
	end

	def edit
		@listing = Listing.find(params[:listing_id])
		@comment = Comment.find(params[:id])
		@method = "put"
	end

	def destroy
		@listing = Listing.find(params[:listing_id])
		@comment = @listing.comments.find(params[:id])
		@comment.destroy
		redirect_to listing_path(@listing), notice: "Comment deleted."
	end

	def update
		@listing = Listing.find(params[:listing_id])
		@comment = @listing.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to @listing, notice: "Comment Updated."
		else
			redirect_to listing_path(@listing), notice: "Comment update failed, please try again."
		end
	end
	private
		def comment_params
			params.require(:comment).permit(:input, :user_id)
		end
end