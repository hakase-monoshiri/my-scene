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
end
