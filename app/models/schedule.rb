class Schedule < ApplicationRecord
  has_many :tasks
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank
  has_many :users
  amoeba do
    enable
  end
  enum privacy: [:professed, :draft]
  validates :title, presence: true, length: {maximum:50}
  validates :describle, presence: true, length: {maximum:250}
end
