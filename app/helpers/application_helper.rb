module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image?
			user.image + "?type=large"
		elsif user.avatar?
			user.avatar
		elsif user.image.nil? && !user.avatar?
			"http://res.cloudinary.com/jacky/image/upload/c_thumb,r_30,w_30/v1453194273/blank_avatar_hhrxwn.png"
		end
	end
end
