class AddAllergiesToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :allergies, :text
  end

  def self.down
    remove_column :children, :allergies
  end
end
