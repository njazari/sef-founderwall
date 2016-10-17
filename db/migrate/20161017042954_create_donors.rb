class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
    end
  end
end
