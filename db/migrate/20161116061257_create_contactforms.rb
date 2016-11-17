class CreateContactforms < ActiveRecord::Migration
  def change
    create_table :contactforms do |t|

      t.timestamps null: false
    end
  end
end
