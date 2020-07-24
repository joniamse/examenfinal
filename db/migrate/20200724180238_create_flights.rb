class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_date
      t.datetime :arrival_date
      t.datetime :arrival
      t.string :name
      t.string :state_code
      t.string :departure_place
      t.string :arrival_place
      t.string :airport

      t.timestamps
    end
  end
end
