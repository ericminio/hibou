class Family < ActiveRecord::Base
  has_one :address
  has_many :children
  accepts_nested_attributes_for :address

  validates_presence_of :name, :sin
  validates_uniqueness_of :sin
end
