class Vendor < ApplicationRecord
  belongs_to :user, -> { where(role: ["supplier", "admin"])}
  has_many :serviceOfVendors

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :place, presence: true 
end
