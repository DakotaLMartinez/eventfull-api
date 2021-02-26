class GroupSerializer
  include JSONAPI::Serializer
  attributes :id, :name
  has_many :events
end
