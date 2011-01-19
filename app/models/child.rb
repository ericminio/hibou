class Child < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :birth_date
  
  has_many :bookings

  def allergic?
    not allergies.blank?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{full_name.parameterize}"
  end
end
