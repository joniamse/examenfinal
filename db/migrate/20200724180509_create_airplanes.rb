class CreateAirplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplanes do |t|
      t.string :model
      t.string :registration
      t.integer :seatings

      t.timestamps
    end
  end
end
