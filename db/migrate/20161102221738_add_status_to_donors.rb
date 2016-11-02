class AddStatusToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :status, :boolean
  end
end
