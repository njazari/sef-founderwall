class CreateDedications < ActiveRecord::Migration
  def change
    create_table :dedications do |t|

      t.timestamps null: false
    end
  end
end
