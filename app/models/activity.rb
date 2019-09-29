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

 	# def self.every_average_rating #Let's take this out for now
 	# 	every_average_rating = [] 
 	# 	Activity.all.each do |activity| 
 	# 		if activity.average_rating != nil
 	# 			every_average_rating.push({description: activity.description, average_rating: activity.average_rating})
 	# 		end
 	# 	end
 	# 	sorted = every_average_rating.sort_by { |activity| -activity[:average_rating]}
 	# 	sorted
 	# end

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

 	# def self.every_total_completed #Let's take this out for now
 	# 	every_total_completed = [] 
 	# 	Activity.all.each do |activity|
 	# 		if activity.total_completed != nil
 	# 			every_total_completed.push({description: activity.description, total_completed: activity.total_completed})
 	# 		end	
 	# 	end
 	# 	every_total_completed.sort_by{ |activity| -activity[:total_completed]}
 	# end
end
