class AddCoordinateToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :hospitals, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end