class CreateDrones < ActiveRecord::Migration[6.0]
  def change
    create_table :drones do |t|
      t.string :nickname
      t.string :make_and_model
      t.string :serial_number
      t.integer :manufactured_year

      t.timestamps
    end
  end
end
