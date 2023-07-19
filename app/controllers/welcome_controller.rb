class WelcomeController < ApplicationController

    def welcome

    end

    def index
        @car = CarProfile.all.order(created_at: :desc)
    end

end
