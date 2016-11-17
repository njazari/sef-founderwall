class ChangePublishedDefaultFalse < ActiveRecord::Migration
  def change
    change_column :dedications, :published, :boolean, :null => false
  end
end
