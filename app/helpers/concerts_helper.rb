module ConcertsHelper

  def artist_id_field(concert)
      if concert.artist.nil?
        select_tag "concert[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
      else
        hidden_field_tag "concert[artist_id]", concert.artist_id
      end
  end

  def venue_id_field(concert)
      if concert.venue.nil?
        select_tag "concert[venue_id]", options_from_collection_for_select(Venue.all, :id, :name)
      else
        hidden_field_tag "concert[venue_id]", concert.venue_id
      end
  end

  def concert_name_link(concert)
    if @artist
      link_to concert.name, artist_concert_path(@artist, concert)
    elsif @venue
      link_to concert.name, venue_concert_path(@venue, concert) 
    else
      link_to concert.name, concert_path(concert) 
    end
  end

end
