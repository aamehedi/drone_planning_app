class CreateMissionForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_forecasts do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :forecast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
