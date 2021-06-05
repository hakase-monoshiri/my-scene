class ApplicationController < ActionController::Base

    
    def require_login
        @current_user_artist = current_user_artist
        return head(:forbidden) unless logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user_artist
        Artist.find_by(id: session[:user_id])
    end

    def current_user_id
        if current_user_artist
            current_user_artist.id
        end
    end
    
    
end
