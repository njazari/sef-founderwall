class AddTierAndPhotoToDedications < ActiveRecord::Migration
  def change
    add_column :dedications, :tier, :string
    add_column :dedications, :photo, :string
  end
end
