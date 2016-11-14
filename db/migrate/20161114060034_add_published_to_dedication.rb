class AddPublishedToDedication < ActiveRecord::Migration
  def change
    add_column :dedications, :published, :boolean
  end
end
