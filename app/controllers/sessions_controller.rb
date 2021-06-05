class SessionsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.find_by(email: params[:artist][:email])
        if @artist.authenticate(params[:artist][:password])
            session[:user_id] = @artist.id
            redirect_to artist_path(@artist)
        else
            render "new"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end
end