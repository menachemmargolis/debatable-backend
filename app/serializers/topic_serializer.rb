class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :catagory, :topic_image
  belongs_to :catagory
end
