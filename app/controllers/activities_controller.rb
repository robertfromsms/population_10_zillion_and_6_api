class ActivitiesController < ApplicationController

	def index
		activities = Activity.all
		render json: activities
	end

	def show
		activity = Activity.find_by(id: params[:id])
		render json: { 
			activity: {
				description: activity.description, 
				category: activity.category,
				participants: activity.participants,
				average_rating: activity.average_rating,
				total_completed: activity.total_completed,
				comments_with_users: activity.comments_with_users
			}
		}
	end
end