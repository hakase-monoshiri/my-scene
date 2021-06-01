class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def show
        @venue = Venue.find_by(id: params[:id])
    end

    def new
        @venue = Venue.new
    end

end
