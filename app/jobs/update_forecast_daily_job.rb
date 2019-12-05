class UpdateForecastDailyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UpdateForecast.new.run(WeatherbitForecastApi.new)
  end
end
