class Client < ApplicationRecord
  belongs_to :user

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_street_address
    "#{self.address} #{self.city}, #{self.state}, #{self.zip}"
  end

  def lat
    self.latitude
  end

  def lng
    self.longitude
  end

end