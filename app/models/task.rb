class Task < ApplicationRecord
  belongs_to :schedule
  validates :title, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum:150}
end
