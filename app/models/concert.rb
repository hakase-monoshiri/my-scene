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


    def self.search(query)
        if query
            self.where("name LIKE ?", "%#{query}%")
        else
            self.all
        end
    end



end

