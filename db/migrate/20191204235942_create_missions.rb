class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
