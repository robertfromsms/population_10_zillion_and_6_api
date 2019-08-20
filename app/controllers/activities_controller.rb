class ActivitiesController < ApplicationController
	def highestratedmostpopular
		every_average_rate = Activity.every_average_rating
		every_completed_count = Activity.every_total_completed
		render json: {everyAverageRating: every_average_rate, everyTotalCompleted: every_completed_count},
			status: :ok
	end

	def showbydescription
		@activity = Activity.find_by(description: params[:activity][:description])
		if @activity
			render json: { activity: ActivitySerializer.new(@activity) }, 
				status: :ok
		else
			render json: { error: "activity not found"},
        		status: :not_acceptable
        end
	end
end