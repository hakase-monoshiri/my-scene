module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def login_logout_button
        if logged_in?
            link_to "Log-out", logout_path, method: :post
        else
            link_to "Log-in", login_path
        end
    end

    def add_concert_button
        if @artist
            button_to "Add a concert", new_artist_concert_path(@artist), method: :get
        elsif @venue
            button_to "Add a concert", new_venue_concert_path(@venue), method: :get
        end
    end

end
