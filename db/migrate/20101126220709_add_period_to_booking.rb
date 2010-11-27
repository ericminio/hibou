class AddPeriodToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :period, :string
  end

  def self.down
    remove_column :booking, :string
  end
end
