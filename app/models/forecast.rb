class Forecast < ApplicationRecord
  has_many :mission_forecasts, dependent: :destroy
  has_many :missions, through: :missions

  validates :postal_code, presence: true
  validates_date :valid_date

  def self.destroy_unlinked_forecasts
    Forecast
      .left_outer_joins(:mission_forecasts)
      .where(mission_forecasts: { id: nil })
      .destroy_all
  end
end
