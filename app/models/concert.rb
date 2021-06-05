class Concert < ApplicationRecord

    belongs_to :artist
    belongs_to :venue

    include ActiveModel::Validations
    validates_with TimeValidator

    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :name, presence: true

    scope :over, -> { where("end_time < ?", DateTime.now) }

    scope :not_over, -> { where("end_time > ?", DateTime.now) }

    scope :upcoming, -> { not_over.where("start_time BETWEEN ? AND ?", DateTime.now + 30.days, DateTime.now ) } 


    def self.search(option, query)
        case option
        when "Name"
            self.where("name LIKE ?", "%#{query}%")
        when "Artist"
            artist = Artist.where("name LIKE ?", "%#{query}%").first
            if artist
                self.where(artist_id: artist.id)
            else
                self.where("name LIKE ?", "%#{query}%")
            end
        when "Venue"
            venue  = Venue.where("name LIKE ?", "%#{query}%").first
            if venue
                self.where(venue_id: venue.id)
            else
                self.where("name LIKE ?", "%#{query}%")
            end
        end
    end



end

