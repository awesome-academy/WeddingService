class Service < ApplicationRecord
  validates :name, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum: 200}
end
