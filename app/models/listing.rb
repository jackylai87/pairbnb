class Listing < ActiveRecord::Base
	mount_uploaders :images, ImageUploader
	mount_uploader :sub_image_one, ImageUploader
	mount_uploader :sub_image_two, ImageUploader
	validates :title, :home_type, :room_type, :accomodate, :location, presence: true
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :reservations, dependent: :destroy
	geocoded_by :location
	after_validation :geocode
	acts_as_taggable
	
	searchkick match: :word_start, searchable: [:location]
end