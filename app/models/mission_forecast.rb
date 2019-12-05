class MissionForecast < ApplicationRecord
  belongs_to :mission
  belongs_to :forecast
end
