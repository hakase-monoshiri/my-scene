class Artist < ApplicationRecord

    has_many :concerts
    has_many :venues, through: :concerts
    
    validates :name, presence: true

    has_secure_password

    
end
