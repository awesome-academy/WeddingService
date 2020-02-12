class Task < ApplicationRecord
  acts_as_paranoid
  belongs_to :schedule
  belongs_to :service, optional: true
  amoeba do
    enable
  end
  validates :title, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum:150}
  belongs_to :serviceOfVendor, class_name: "ServiceOfVendor", foreign_key: "service_of_vendor_id", optional: true
end
