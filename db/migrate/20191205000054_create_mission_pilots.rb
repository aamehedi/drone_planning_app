class CreateMissionPilots < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_pilots do |t|
      t.references :mission
      t.references :pilot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
