class Concert < ApplicationRecord

    belongs_to :artist
    belongs_to :venue

    include ActiveModel::Validations
    validates_with TimeValidator


    scope :over, -> { where("end_time < ?", DateTime.now) }

    scope :not_over, -> { where("end_time > ?", DateTime.now) }

    scope :upcoming, -> { not_over.where("start_time BETWEEN ? AND ?", DateTime.now + 30.days, DateTime.now ) } 


end

