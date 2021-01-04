class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true
  # enum status: {uninitiated: 0, signed: 1, material_list: 2, permit_package: 3, approved: 4, rejected: 5, scheduling: 6, in_progress: 7, completed: 8}


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
