class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.integer :surgeries
      t.string :story
      t.string :building_status
      t.integer :money_raised
      t.integer :cost
      t.string :contact
      t.string :founded
      t.string :state
      
      t.timestamps
    end
  end
end