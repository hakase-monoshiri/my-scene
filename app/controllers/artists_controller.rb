class ArtistsController < ApplicationController

    before_action :only_logged_in_artist
    before_action :current_user_artist
    skip_before_action :only_logged_in_artist, only: [:index, :show, :new, :create]

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
        params.require(:artist).permit(:name, :hometown, :bio, :email, :password, :password_confirmation)
    end

    def only_logged_in_artist
        return head(:forbidden) unless params[:id].to_i == current_user_id
    end

end
