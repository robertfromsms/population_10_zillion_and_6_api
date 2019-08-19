class ActivitySerializer < ActiveModel::Serializer
  attributes :description, :accessibility, :category, :participants, :price, :comments_with_users

  def comments_with_users
  	comments_with_users = self.object.comments.map do |comment|
  		{
  			user: comment.user.user_name,
  			content: comment.content,
  			written_at: comment.created_at
  		}
  	end
  	(comments_with_users.sort_by { |comment| comment[:written_at]}).reverse
  end
end
