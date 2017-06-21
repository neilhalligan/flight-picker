class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: "to_airport_id",
                     dependent: :destroy
  has_many :departing_flights, foreign_key: "from_airport_id",
                     dependent: :destroy
end
