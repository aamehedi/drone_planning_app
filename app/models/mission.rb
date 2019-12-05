class Mission < ApplicationRecord
  has_many :mission_pilots, dependent: :destroy
  has_many :pilots, through: :mission_pilots
  has_many :mission_drones, dependent: :destroy
  has_many :drones, through: :mission_drones

  validates :location, :name, :pilots, :drones, presence: true
  validates :start_date,
            timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates :end_date, timeliness: { after: :start_date, type: :date }
end
