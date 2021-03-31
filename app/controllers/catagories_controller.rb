class CatagoriesController < ApplicationController
    def index
        catagories = Catagory.all
        render json: catagories
    end
end
