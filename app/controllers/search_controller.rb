class SearchController < ApplicationController

    def create
        @search = params[:search]
        @method = params[:search_method]
        @cars = CarProfile.where("#{@method} ILIKE?", "%#{@search}%")
    end

end