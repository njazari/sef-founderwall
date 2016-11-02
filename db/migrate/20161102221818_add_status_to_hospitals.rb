class AddStatusToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :status, :boolean
  end
end
