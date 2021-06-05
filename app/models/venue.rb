class Venue < ApplicationRecord

    has_many :concerts
    has_one :address
    has_many :artists, through: :concerts

    accepts_nested_attributes_for :address

    include ActiveModel::Validations
    validates_with AddressValidator

    validates :name, presence: true

    
    
end
