class AddTopicImageToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :topic_image, :string
  end
end
