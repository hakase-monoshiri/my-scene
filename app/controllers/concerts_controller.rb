class ConcertsController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def index
        if params[:artist_id]
            @artist = Artist.find_by(id: params[:artist_id])
            if @artist
                @concerts = @artist.concerts
            else
                redirect_to concerts_path
            end
        elsif params[:venue_id]
            @venue = Venue.find_by(id: params[:venue_id])
            if @venue
                @concerts = @venue.concerts
            else
                redirect_to concerts_path
            end
        else
            @concerts = Concert.all
        end
    end

    def show
        if params[:artist_id]
            @artist = Artist.find_by(id: params[:artist_id])
            if @artist.nil?
              redirect_to artists_path, alert: "Artist not found."
            else
                @concert = @artist.concerts.find_by(id: params[:id])
                    redirect_to artist_concerts_path(artist), alert: "Post not found." if @concert.nil?
            end
        elsif params[:venue_id]
            @venue = Venue.find_by(id: params[:venue_id])
            if @venue.nil?
                redirect_to venues_path, alert: "Venue not found."
            else
                @concert = @venue.concerts.find_by(id: params[:id])
                    redirect_to venue_concerts_path(venue), alert: "Concert not found." if @concert.nil?
            end
        else
            @concert = Concert.find(params[:id])
        end
    end

    def new
        @concert = Concert.new(artist_id: params[:artist_id], venue_id: params[:venue_id])
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
        if params[:artist_id]
            @artist = Artist.find_by(id: params[:artist_id])
            if @artist.nil?
              redirect_to artists_path, alert: "Artist not found."
            else
                @concert = @artist.concerts.find_by(id: params[:id])
                    redirect_to artist_concerts_path(artist), alert: "Post not found." if @concert.nil?
            end
        elsif params[:venue_id]
            @venue = Venue.find_by(id: params[:venue_id])
            if @venue.nil?
                redirect_to venues_path, alert: "Venue not found."
            else
                @concert = @venue.concerts.find_by(id: params[:id])
                    redirect_to venue_concerts_path(venue), alert: "Concert not found." if @concert.nil?
            end
        else
            @concert = Concert.find(params[:id])
        end
    end

    def update
        @concert = Concert.find_by(id: params[:id])
        if @concert.update(concert_params)
            redirect_to concert_path(@concert)
        else
            render "edit"
        end
    end

    def destroy
        @concert = Concert.find_by(id: params[:id])
        @concert.destroy
        redirect_to concerts_path
    end



    private

    def concert_params
        params.require(:concert).permit(:name, :description, :start_time, :end_time, :artist_id, :venue_id)
    end

end
