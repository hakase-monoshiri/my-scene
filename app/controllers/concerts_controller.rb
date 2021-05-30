class ConcertsController < ApplicationController

    def index
        if params[:artist_id]
            artist = Artist.find_by(id: params[:artist_id])
            if artist
                @concerts = artist.concerts
            else
                redirect_to concerts_path
            end
        elsif params[:venue_id]
            venue = Venue.find_by(id: params[:venue_id])
            if venue
                @concerts = venue.concerts
            else
                redirect_to concerts_path
            end
        else
            @concerts = Concert.all
        end
    end
end
