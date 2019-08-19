class CommentsController < ApplicationController
	def create
		@the_activity = Activity.find_by(description: params[:comment][:activity_description])
		@the_comment = Comment.new(user_id: @current_user.id, activity_id: @the_activity.id, content: params[:comment][:content])

		if @the_comment.save
			render json: {comment: CommentSerializer.new(@the_comment), message: 'Comment Created Sucessfully'},
  				status: :created
		else
			render json: {error: 'failed to create comment'}
		end
	end

	def update
		@the_comment = Comment.find_by(id: params[:id])

		if @the_comment.update(content: params[:comment][:content])
			render json: {comment: CommentSerializer.new(@the_comment), message: 'Comment Updated Sucessfully'},
      			status: :updated
      	else
      		render json: {error: 'failed to update comment'}
      	end
    end
end