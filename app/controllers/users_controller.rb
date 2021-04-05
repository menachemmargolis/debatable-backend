class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :updateProfilePhoto, :updateUsername  ]
   
  def index
    users= User.all

    render json: users
  end


    def create
      if params[:profile_photo] == ""
        image_to_use = "https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg"
      else 
        image = Cloudinary::Uploader.upload(params[:profile_photo])
        image_to_use = image["url"]
      end
      user_params = params.permit(:username, :password, :email)
      user = User.create(username:params[:username],password:params[:password], profile_photo:image_to_use , email: params[:user_email])
      if user.valid?
        token = JWT.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
        render json: { user: UserSerializer.new(user), token: token }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end

    end

    def login 
    user = User.find_by(username: params[:username]) 

    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end

    end

    def updateUsername
      user = @current_user
      user.update_attribute(:username, params[:username])

      render json: user
    end

    def updateProfilePhoto
      user = @current_user
      image = Cloudinary::Uploader.upload(params["profile_photo"])
      user.update_attribute(:profile_photo, image["url"])

      render json: user
    end


    def show 
      render json: @current_user
    end


end
