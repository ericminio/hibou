class AddSnackAndNapToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :snack, :boolean
    add_column :children, :nap, :boolean
  end

  def self.down
    remove_column :children, :nap
    remove_column :children, :snack
  end
end
