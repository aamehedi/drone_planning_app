class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :forecasts do |t|
      t.string :postal_code
      t.date :valid_date
      t.text :data

      t.timestamps
    end
  end
end
