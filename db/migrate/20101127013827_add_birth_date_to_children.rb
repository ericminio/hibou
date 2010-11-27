class AddBirthDateToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :birth_date, :date
  end

  def self.down
    remove_column :children, :birth_date
  end
end
