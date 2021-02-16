class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :checkins, as: :checkinable, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy

  validates :category, presence: true


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

  def project_owner
    self.projectable.name
  end

end
