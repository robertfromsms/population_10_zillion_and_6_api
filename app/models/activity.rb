class Activity < ApplicationRecord
	validates :description, presence: true, uniqueness: true
	validates :accessibility, presence: true
	validates :category, presence: true
	validates :participants, presence: true
	validates :price, presence: true
	validates :apiKey, presence: true, uniqueness: true

	has_many :activity_instances
 	has_many :users, through: :activity_instances

 	has_many :comments

 	def average_rating
 		ActivityInstance.where(activity_id: self.id).average(:rating)
 	end

 	def total_completed
 		ActivityInstance.where(activity_id: self.id, completed: true).length
 	end

	def comments_with_users
	  	comments_with_users = self.comments.map do |comment|
	  		{
	  			user: comment.user.user_name,
	  			content: comment.content,
	  			written_at: comment.created_at
	  		}
	  	end
	  	(comments_with_users.sort_by { |comment| comment[:written_at]}).reverse
	end
end
