class TrafficDisruptionSerializer < ActiveModel::Serializer
  attributes :id, :event_start_at, :coordinates, :comments,

  def coordinates
    [object.latitude, object.longitude]
  end
end
