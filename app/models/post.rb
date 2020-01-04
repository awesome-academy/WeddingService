require 'uri'

class Post < ApplicationRecord
  has_one_attached :image

  validates :title, :description, presence: true, length: { maximum: 600 }
  validates :content, presence: true, length: { maximum: 60000 }

  scope :latest, -> { order updated_at: :DESC }

  def set_image url
    return if  url.blank?
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
    image.attach io: file, filename: filename
  rescue
    nil
  end
end
