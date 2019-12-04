class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :certification_type

      t.timestamps
    end
  end
end
