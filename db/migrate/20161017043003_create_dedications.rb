class CreateDedications < ActiveRecord::Migration
  def change
    create_table :dedications do |t|
      t.string :dedication
      t.string :status
      t.references :hospital
      t.references :donor
    end
  end
end
