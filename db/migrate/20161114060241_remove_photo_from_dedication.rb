class RemovePhotoFromDedication < ActiveRecord::Migration
  def change
    remove_column :dedications, :photo, :string
  end
end
