class CreateDedications < ActiveRecord::Migration
  def change
    create_table :dedications do |t|
      t.string :dedication
      t.boolean :status
      t.references :hospital
      t.references :donor
      t.string :tier
      t.string :photo
    end
  end
end