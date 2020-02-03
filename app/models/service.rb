class Service < ApplicationRecord
  validates :name, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum: 200}
  has_many :tasks
  has_many :serviceOfVendors, class_name: "ServiceOfVendor", foreign_key: "service_id"
  amoeba do
    enable
  end

end
