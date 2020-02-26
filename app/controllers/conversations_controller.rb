class ConversationsController < ApplicationController
  before_action :set_conversation, except: %i(index)
  before_action :check_participating!, except: %i(index)

  def index
    @conversations = Conversation.participating current_user
  end

  def show
    @conversation = Conversation.find_by id: params[:id]
    @personal_messages = @conversation.personal_messages
    @personal_message = PersonalMessage.new
  end
  
  private
  
  def set_conversation
    @conversation = Conversation.find_by id: params[:id]
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end
