class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def show
        @venue = Venue.find_by(id: params[:id])
    end

    def new
        @venue = Venue.new
        @venue.address = Address.new(venue_id: @venue.id)
    end

    def create
        @venue = Venue.new(venue_params)
        if @venue.save
            redirect_to venue_path(@venue)
        else
            render "new"
        end
    end

    def edit
        @venue = Venue.find_by(id: params[:id])
    end

    private

    def venue_params
        params.require(:venue).permit(
            :name, :description, address_attributes: [
                :street_number,
                :street_name,
                :city,
                :state,
                :zip,
                :venue_id
            ]
        )
    end

end
