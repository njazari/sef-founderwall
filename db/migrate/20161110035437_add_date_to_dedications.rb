class AddDateToDedications < ActiveRecord::Migration
  def change
    add_column :dedications, :date, :string
  end
end
