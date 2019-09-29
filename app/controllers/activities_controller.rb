class ActivitiesController < ApplicationController
	# def highestratedmostpopular
	# 	every_average_rate = Activity.every_average_rating
	# 	every_completed_count = Activity.every_total_completed
	# 	render json: {everyAverageRating: every_average_rate, everyTotalCompleted: every_completed_count},
	# 		status: :ok
	# end

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

	# def showbydescription
	# 	@activity = Activity.find_by(description: params[:activity][:description])
	# 	if @activity
	# 		render json: { activity: ActivitySerializer.new(@activity) }, 
	# 			status: :ok
	# 	else
	# 		render json: { error: "activity not found"},
 #        		status: :not_acceptable
 #        end
	# end
end