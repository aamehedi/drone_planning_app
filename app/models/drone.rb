class Drone < ApplicationRecord
  FIRST_DRONE_MANUFACTURED_YEAR = 1919

  validates :nickname, :make_and_model, :serial_number, presence: true
  validates :manufactured_year, numericality: {
      only_integer: true,
      less_than_or_equal_to: Date.today.year,
      greater_than_or_equal_to: FIRST_DRONE_MANUFACTURED_YEAR
    }
end
