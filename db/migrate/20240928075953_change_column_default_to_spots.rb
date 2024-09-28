class ChangeColumnDefaultToSpots < ActiveRecord::Migration[6.1]
  def change
    change_column_default :spots, :longitude, from: nil, to: "139.767125"
    change_column_default :spots, :latitude, from: nil, to: "35.681236"
  end
end
