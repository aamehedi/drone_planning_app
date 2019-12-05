class Pilot < ApplicationRecord
  has_many :mission_pilots, dependent: :destroy
  has_many :missions, through: :mission_pilots

  validates :first_name, :last_name, :email, :certification_type, presence: true
end
