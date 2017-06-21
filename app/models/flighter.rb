class Flighter < ApplicationRecord
  belongs_to :from_airport
  belongs_to :to_airport
end
