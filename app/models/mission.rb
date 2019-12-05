class Mission < ApplicationRecord
  has_many :mission_pilots, dependent: :destroy
  has_many :pilots, through: :mission_pilots
  has_many :mission_drones, dependent: :destroy
  has_many :drones, through: :mission_drones
  has_many :mission_forecasts, dependent: :destroy
  has_many :forecasts, through: :mission_forecasts

  validates :location, :name, :pilots, :drones, presence: true
  validates :start_date, timeliness: {
    on_or_after: lambda { Date.today },
    type: :date
  }
  validates :end_date, timeliness: { after: :start_date, type: :date }

  scope :after_a_week, -> { where(start_date: Date.today + 7) }
  scope :today, -> { where(start_date: Date.today) }

  before_save :create_forecast_associations
  after_save :destroy_unlinked_forecasts

  def overlaps?
    common_mission_ids = Mission
      .distinct
      .includes(:pilots, :drones)
      .where('pilots.id IN (?) or drones.id IN (?)', pilot_ids, drone_ids)
      .ids
    Mission
      .where(id: common_mission_ids)
      .includes(:forecasts)
      .where(forecasts: { valid_date: start_date..end_date })
      .count > 0
  end

  private

  def create_forecast_associations
    updated_forecasts = []
    start_date.upto(end_date) do |date|
      updated_forecasts << Forecast.find_or_initialize_by(
        postal_code: location, valid_date: date)
    end
    self.forecasts = updated_forecasts
  end

  def destroy_unlinked_forecasts
    Forecast.destroy_unlinked_forecasts
  end
end
