class Reservation < ActiveRecord::Base
	validates :check_in_date, presence: true
	validates :check_out_date, presence: true
  belongs_to :user
  belongs_to :listing
end
