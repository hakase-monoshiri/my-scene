class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def show
        @venue = Venue.find_by(id: params[:id])
    end

end
