class Search < ApplicationRecord
	def posts
		@posts ||= find_posts	
	end

	private

	def find_posts
		posts = Post.order(:created_at)
		posts = post.where("user.mother_tongue like ?", "%#{mother_tongue}%") if mother_tongue.present?
		posts = post.where("post.user.availability.start_time like ?", "%#{start_time}%") if start_time.present?
		posts = post.where("post.user.locality like ?", "%#{locality}%") if locality.present?
		posts
	end
end
