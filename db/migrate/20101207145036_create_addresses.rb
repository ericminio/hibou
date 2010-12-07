class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :civic_number
      t.string :apartment
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.references :family
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
