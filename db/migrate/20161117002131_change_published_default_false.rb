class ChangePublishedDefaultFalse < ActiveRecord::Migration
  def change
    change_column :dedications, :published, :boolean, :default => false, :null => false
  end
end
