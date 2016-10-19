class AddStateToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :state, :string
  end
end
