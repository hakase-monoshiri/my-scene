class AddressValidator < ActiveModel::Validator

    def validate(record)
        unless record.address
            record.errors[:address] << "A Venue without an address in invalid!"
        end
    end

end
