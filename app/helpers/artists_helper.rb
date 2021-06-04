module ArtistsHelper

    def edit_artist_button(artist)
        if artist ==  current_user_artist
            button_to "Edit Artist", edit_artist_path(artist), method: :get
        end
    end

end
