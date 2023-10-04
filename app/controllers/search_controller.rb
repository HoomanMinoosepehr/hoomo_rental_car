class SearchController < ApplicationController

    # search between the car profiles based on the user method and input
    def create
        @search = params[:search]
        @method = params[:search_method]
        @cars = CarProfile.where("#{@method} ILIKE?", "%#{@search}%")
    end

end