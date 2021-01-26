class Checkin < ApplicationRecord
  belongs_to :checkinable, polymorphic: true
end
