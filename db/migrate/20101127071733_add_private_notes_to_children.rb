class AddPrivateNotesToChildren < ActiveRecord::Migration
  def self.up
    rename_column :children, :notes, :public_notes
    add_column :children, :private_notes, :text
  end

  def self.down
    remove_column :children, :private_notes
    rename_column :children, :public_notes, :notes
  end
end
