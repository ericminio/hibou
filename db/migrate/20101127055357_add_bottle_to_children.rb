class AddBottleToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :bottle, :boolean
  end

  def self.down
    remove_column :children, :bottle
  end
end
