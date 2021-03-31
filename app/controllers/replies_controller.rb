class RepliesController < ApplicationController
    #  before_action :authenticate, only: [:create]
   
    def index
        replies= Reply.all
    
        render json: replies
    end

    def create
        reply = Reply.create(title: params[:title],content: params[:content], user_id: params[:user_id], post_id: params[:post_id])
        if reply.valid? 
         render json: reply
        else
          render json: {errors: reply.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        reply = Reply.find(params[:id])
        reply.destroy
        render json: Reply.all
    end
    
end
