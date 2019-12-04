class Pilot < ApplicationRecord
  validates :first_name, :last_name, :email, :certification_type, presence: true
end
