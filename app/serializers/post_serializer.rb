class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :topic_id, :title, :content, :replies

  has_many :replies
end
