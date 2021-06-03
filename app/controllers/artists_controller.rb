class ArtistsController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:index, :show, :new]

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
            session[:user_id] = @artist.id
            redirect_to artist_path(@artist)
        else
            render "new"
        end
    end

    def edit
        @artist = Artist.find_by(id: params[:id])
    end

    def update
        @artist = Artist.find_by(id: params[:id])
        if @artist.update(artist_params)
            redirect_to artist_path(@artist)
        else
            render "edit"
        end
    end

    def destroy
        artist = Artist.find_by(id: params[:id])
        artist.destroy
        redirect_to artists_path
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :hometown, :bio, :password, :password_confirmation)
    end

    
end
