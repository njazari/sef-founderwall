class AddDonorIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donor_id, :integer
  end
end
