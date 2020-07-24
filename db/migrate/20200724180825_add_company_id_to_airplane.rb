class AddCompanyIdToAirplane < ActiveRecord::Migration[6.0]
  def change
    add_reference :airplanes, :company, null: false, foreign_key: true
  end
end
