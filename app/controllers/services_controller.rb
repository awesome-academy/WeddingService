class ServicesController < ApplicationController
  def index
    @pagy, @services = pagy Service.all, items: 4
  end
end
