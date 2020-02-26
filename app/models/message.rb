class Message < ApplicationRecord
  after_create :send_message
  belongs_to :user
  
  private
  def send_message
    ActionCable.server.broadcast "room_channel", render_message(self)
  end
  
  def render_message message
    ApplicationController.renderer.render(message)
  end
end
