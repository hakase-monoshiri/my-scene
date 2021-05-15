class Venue < ApplicationRecord

    has_many :concerts
    has_one :address
    has_many :artists, through: :concerts

    # include ActiveModel::Validations


    # validates_with AddressValidator
    validates :name, presence: true

    extend Searchable
    
    # def self.search(query)
    #     if !query.empty?
    #         self.where("name LIKE ?", "%#{query}%")
    #     else
    #         self.all
    #     end
    # end

end
