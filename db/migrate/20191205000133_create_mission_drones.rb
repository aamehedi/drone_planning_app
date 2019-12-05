class CreateMissionDrones < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_drones do |t|
      t.references :mission
      t.references :drone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
