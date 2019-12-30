class New < ApplicationRecord
  validates :title, :description, presence: true, length: { maximum: 600 }
  validates :content, presence: true, length: { maximum: 60000 }

  scope :latest, -> { order updated_at: :DESC }
end
