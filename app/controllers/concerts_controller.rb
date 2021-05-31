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

    def show
        @concert = Concert.find_by(id: params[:id])
    end

    def new
        @concert = Concert.new
    end

    def create
        concert = Concert.new(concert_params)
        if concert.save
            redirect_to concert_path(concert)
        else
            render "new"
        end
    end

    def edit
        @concert = Concert.find_by(id: params[:id])
    end


    private

    def concert_params
        params.require(:concert).permit(:name, :description, :start_time, :end_time, :artist_id, :venue_id)
    end
end
