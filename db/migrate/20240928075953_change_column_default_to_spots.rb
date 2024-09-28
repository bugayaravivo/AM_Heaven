class ChangeColumnDefaultToSpots < ActiveRecord::Migration[6.1]
  def change
    change_column_default :spots, :longitude, from: "139.767125", to: "0.139767125e3"
    change_column_default :spots, :latitude, from: "35.681236", to: "0.35681236e2"
  end
end
