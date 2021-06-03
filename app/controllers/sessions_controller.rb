class SessionsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.find_by(name: params[:name])
        return head(:forbidden) unless @artist.authenticate(params[:password])
        session[:user_id] = @artist.id
    end

    def destroy
        session.delete :username
    end
end