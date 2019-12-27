class ServiceOfVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :service
end
