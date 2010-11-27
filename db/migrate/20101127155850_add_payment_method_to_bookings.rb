class AddPaymentMethodToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :payment_method, :string, :default => 'Autre'
  end

  def self.down
    remove_column :bookings, :payment_method
  end
end
