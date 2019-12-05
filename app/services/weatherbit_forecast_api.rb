class WeatherbitForecastApi
  include ForecastApi

  WEATHERBIT_DAILY_URL = 'https://api.weatherbit.io/v2.0/forecast/daily'.freeze

  def get_data(postal_code)
    response = Faraday.get(
        WEATHERBIT_DAILY_URL,
        {
            postal_code: postal_code,
            key: Rails.application.credentials.weatherbit_key
        },
        { Accept: 'application/json' }
    )
    return unless response.success?
    JSON.parse(response.body)['data']
  end
end
