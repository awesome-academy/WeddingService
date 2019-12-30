class NewsController < ApplicationController
  before_action :get_new, only: %i(show edit)

  def index
    @news = New.all.latest
  end

  def show
  end

  private
  def get_new
    @new = New.find_by id: params[:id]
    return if @new
    redirect_to news_path
  end
end
