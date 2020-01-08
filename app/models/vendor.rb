class Vendor < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user, -> { where(role: ["supplier", "admin"])}
  has_many :serviceOfVendors

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :place, presence: true
  
  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
