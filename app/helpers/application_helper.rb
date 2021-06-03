module ApplicationHelper

    def current_user_artist
        Artist.find_by(id: session[:user_id])
    end
end
