class PostsController < ApplicationController

    def index
        posts = Post.all
    
        render json: posts
    end

    def create
        post = Post.create(title: params[:title],content: params[:content], user_id: params[:user_id], topic_id: params[:topic_id])
       if post.valid?
        render json: post, status: :created
       else 
        render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
       end
    end

    def update
        post = Post.find(params[:id])
        post.update(title: params[:title], content: params[:content])
        posts = Post.all
        render json: posts
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
    end

end
