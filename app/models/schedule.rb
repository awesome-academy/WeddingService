class Schedule < ApplicationRecord
  has_many :tasks
  validates :title, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum:250}
end
