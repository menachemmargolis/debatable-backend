class TopicsController < ApplicationController

   def index
    topics = Topic.all

    render json: topics
   end

   def create
      if params[:topic_image] == ""
         image_to_use = "https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg"
       else 
         image = Cloudinary::Uploader.upload(params[:topic_image])
         image_to_use = image["url"]
       end
      topic = Topic.create(title: params[:title], description: params[:decription], catagory_id: params[:catagory_id], topic_image: image_to_use )
      if topic.valid?
       render json: topic
      else
         render json: {errors: topic.errors.full_messages}, status: :unprocessable_entity
      end
  end


end
