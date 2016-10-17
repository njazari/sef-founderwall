class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.string :lat
      t.string :long
      t.integer :surgeries
      t.string :story
      t.string :status
      t.integer :raised
      t.integer :cost
      
      t.timestamps
    end
  end
end
