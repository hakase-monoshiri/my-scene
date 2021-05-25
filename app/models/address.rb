class Address < ApplicationRecord

    belongs_to :venue

    validates :street_number, presence: true
    validates :street_name, presence: true
    validates :zip, presence: true
    validates :zip, length: { is: 5}
end
