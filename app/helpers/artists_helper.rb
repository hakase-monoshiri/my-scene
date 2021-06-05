module ArtistsHelper

    def edit_artist_button(artist, current_user)
        if artist ==  current_user
            button_to "Edit Artist", edit_artist_path(artist), method: :get
        end
    end

end
