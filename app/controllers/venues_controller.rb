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

    def update
        @venue = Venue.find_by(id: params[:id])
        if @venue.update(venue_params)
            redirect_to venue_path(@venue)
        else
            render "edit"
        end
    end

    def destroy
        venue = Venue.find_by(id: params[:id])
        venue.destroy
        redirect_to venues_path
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
                :id
            ]
        )
    end

end
