class WelcomeController < ApplicationController

    def welcome

    end

    # creating a list of ads for the index page
    def index
        @car = CarProfile.all.order(created_at: :desc)
    end

end
