class Address < ActiveRecord::Base
  belongs_to :family

  #validates_presence_of :civic_number, :apartment, :street, :city, :province, :postal_code, :family
end
