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
                redirect_to new_artist_path, notice: "Artist not found"
            end
        else    
            @artist = Artist.find_by(email: params[:artist][:email])
            if @artist.authenticate(params[:artist][:password])
                session[:user_id] = @artist.id
                redirect_to artist_path(@artist)
            else
                flash[:alert] = "Artist not found."
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