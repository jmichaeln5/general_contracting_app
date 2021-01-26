class Client < ApplicationRecord
  belongs_to :user
  has_many :projects, as: :projectable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :checkins, as: :checkinable, dependent: :destroy

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  enum lead_status: [:cold, :warm, :estimate_started, :estimate_completed, :contract_signed, :company_assigned, :project_started, :project_in_progress, :project_completed]

  enum type_of_project: {general: 0, glass: 1, roof: 2}

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
