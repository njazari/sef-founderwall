class EditColumnsOfDedications < ActiveRecord::Migration
  def change
    change_column :dedications, :status, :boolean
    change_column :dedications, :tier, :string
  end
end
