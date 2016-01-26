class Listing < ActiveRecord::Base
	after_validation :convert_integer
	mount_uploaders :images, ImageUploader
	mount_uploader :main_image, ImageUploader
	mount_uploader :sub_image_one, ImageUploader
	mount_uploader :sub_image_two, ImageUploader
	validates :title, :home_type, :room_type, :accomodate, :location, :city_state, :main_image, :sub_image_one, :sub_image_two, :country, presence: true
	validates_numericality_of :price, :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 99999
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :reservations, dependent: :destroy
	geocoded_by :location
	after_validation :geocode
	acts_as_taggable
	
	searchkick match: :word_start, searchable: [:location, :city_state, :country, :title]

	def convert_integer
		self.price = self.price.to_i
	end
end