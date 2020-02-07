class ServiceOfVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :service
  amoeba do
    enable
  end
end
