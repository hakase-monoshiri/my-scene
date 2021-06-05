class TimeValidator < ActiveModel::Validator

    def validate(record)
        unless record.start_time < record.end_time
            record.errors.add(:time, "A concert can't start before it ends!")
        end
    end

end