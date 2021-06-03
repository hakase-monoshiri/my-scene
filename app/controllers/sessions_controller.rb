class SessionsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.find_by(name: params[:artist][:name])
        return head(:forbidden) unless @artist.authenticate(params[:artist][:password])
        session[:user_id] = @artist.id
        redirect_to artist_path(@artist)
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end
end