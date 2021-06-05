class SessionsController < ApplicationController

    def new
        @artist = Artist.new
    end

    def create
        if auth_hash
            @artist = Artist.find_by(email: auth_hash['info']['email'])
            if @artist
                session[:user_id] = @artist.id
                redirect_to artist_path(@artist)
            else
                @artist = Artist.new(email: auth_hash['info']['email'])
                flash[:alert] = "Artist not found, You can sign up here!"
                render "artists/new"
            end
        else    
            @artist = Artist.find_by(email: params[:artist][:email])
            if @artist && @artist.authenticate(params[:artist][:password])
                session[:user_id] = @artist.id
                redirect_to artist_path(@artist)
            else
                @artist = Artist.new(email: params[:artist][:email])
                flash[:alert] = "Artist not found with those credentials."
                render "new"
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
end