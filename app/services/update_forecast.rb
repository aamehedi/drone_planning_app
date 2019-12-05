class UpdateForecast
  def run(forecast_api)
    postal_codes = Forecast
      .where('valid_date >= ?', Date.today)
      .distinct
      .pluck(:postal_code)

    postal_codes.each do |postal_code|
      api_forecasts = forecast_api.get_data(postal_code)
      api_forecasts.each do |api_forecast|
        forecast = Forecast.find_by(
          postal_code: postal_code,
          valid_date: api_forecast['valid_date']
        )
        if forecast
          forecast.update(data: api_forecast, data_updated_at: DateTime.now)
        end
      end
    end
  end
end
