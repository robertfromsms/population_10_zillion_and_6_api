class ActivityInstanceSerializer < ActiveModel::Serializer
  attributes :id, :description, :rating, :completed, :activity_started_at, :activity_details
  
  def description
    return self.object.activity.description
  end

  def activity_started_at
    return self.object.created_at
  end

  def activity_details
  	{
  		description: self.object.activity.description,
  		accessibility: self.object.activity.accessibility,
      category: self.object.activity.category,
      participants: self.object.activity.participants,
      price: self.object.activity.price
  	}
  end
end
