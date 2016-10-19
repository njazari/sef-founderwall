class ChangeTierInDedications < ActiveRecord::Migration
  def change
    change_column :dedications, :tier, :boolean
  end
end
