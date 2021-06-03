module ApplicationHelper

    def current_user_artist
        Artist.find_by(id: session[:user_id])
    end

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

end
