module VenuesHelper

    def edit_venue_button(venue, artist)
        if artist
            if artist.venues.include?(venue)
                button_to "Edit Venue", edit_venue_path(venue), method: :get
            end
        end
    end

end
