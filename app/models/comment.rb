class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  validates :input, presence: true
end
