class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find_by(id: params[:id])
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render "new"
        end
    end

    def edit
        @artist = Artist.find_by(id: params[:id])
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :hometown, :bio, :password, :password_confirmation)
    end

end
