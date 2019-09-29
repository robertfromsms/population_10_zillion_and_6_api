class CommentsController < ApplicationController
	def create
		@the_activity = Activity.find_by(id: params[:comment][:activity_id])
		@the_comment = Comment.new(user_id: @current_user.id, activity_id: @the_activity.id, content: params[:comment][:content])

		if @the_comment.save
			render json: {
				comment: {
					id: @the_comment.id, 
					user: @the_comment.user.user_name, 
					content: @the_comment.content,
					written_at: @the_comment.created_at
				},
				message: 'Comment Created Sucessfully'
			},
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