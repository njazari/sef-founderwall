class AddSecretToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :secret, :string
  end
end
