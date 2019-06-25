class Reservation < ApplicationRecord
    validates :start_date,
            presence: true
    validates :end_date,
            presence: true
    validate :reservation_dates_must_make_sense
    private
        def reservation_dates_must_make_sense
            if end_date <= start_date
                errors.add(:start_date, 'has to be before the end date')
            end
        end
end
