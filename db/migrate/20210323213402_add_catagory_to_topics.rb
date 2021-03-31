class AddCatagoryToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :catagory_id, :string
  end
end
