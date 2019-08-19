class ActivityInstancesController < ApplicationController
	def create
		if Activity.find_by(description: params[:activity][:description])
			@the_activity = Activity.find_by(description: params[:activity][:description])
			@the_activity_instance = ActivityInstance.new(user_id: @current_user.id, activity_id: @the_activity.id, completed: false)

			if @the_activity_instance.save
				render json: {activity_instance: ActivityInstanceSerializer.new(@the_activity_instance), message: 'Activity Instance Created Sucessfully'},
      				status: :created
			else
				render json: {error: 'failed to create activity instance'}
			end
		else
			@the_activity = Activity.new(activity_params)
			
			if @the_activity.save
				@the_activity_instance = ActivityInstance.new(user_id: @current_user.id, activity_id: @the_activity.id, completed: false)
				
				if @the_activity_instance.save
					render json: {activity_instance: ActivityInstanceSerializer.new(@the_activity_instance), message: 'Activity Instance Created Sucessfully'},
      					status: :created
      			else
      				render json: {error: 'failed to create activity instance'}
      			end
			else
				render json: {error: 'failed to record activity, sorry about that!'}
			end	
		end
	end

	def update
		@the_activity_instance = ActivityInstance.find_by(id: params[:id])

		if @the_activity_instance.update(activity_instance_params)
			render json: {activity_instance: ActivityInstanceSerializer.new(@the_activity_instance), message: 'Activity Instance Updated Sucessfully'},
      			status: :updated
      	else
      		render json: {error: 'failed to update activity instance'}
      	end
    end

	private
	def activity_params
		params.require(:activity)
      		.permit(:description,
					:accessibility,
					:category,
    				:participants,
					:price,
    				:apiKey)
  	end

  	def activity_instance_params
		params.require(:activity_instance)
      		.permit(:rating,
      				:completed)
  	end
end
