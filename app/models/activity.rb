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
 		all_instances_of_this_activity = ActivityInstance.where(activity_id: self.id)
 		all_ratings = (all_instances_of_this_activity.map do |instance|
 			instance.rating
 		end).select do |rating|
 			rating
 		end
 		if all_ratings == []
 			return nil
 		else
 			(all_ratings.sum)/(all_ratings.length)
 		end
 	end

 	def self.every_average_rating
 		every_average_rating = [] 
 		Activity.all.each do |activity| 
 			if activity.average_rating != nil
 				every_average_rating.push({description: activity.description, average_rating: activity.average_rating})
 			end
 		end
 		sorted = every_average_rating.sort_by { |activity| -activity[:average_rating]}
 		sorted
 	end

 	def total_completed
 		all_instances_of_this_activity = ActivityInstance.where(activity_id: self.id)
 		completed_array = (all_instances_of_this_activity.map do |instance|
 			instance.completed
 		end).select do |completed|
 			completed
 		end
 		completed_array.length
 	end

 	def self.every_total_completed
 		every_total_completed = [] 
 		Activity.all.each do |activity|
 			if activity.total_completed != nil
 				every_total_completed.push({description: activity.description, total_completed: activity.total_completed})
 			end	
 		end
 		every_total_completed.sort_by{ |activity| -activity[:total_completed]}
 	end
end
