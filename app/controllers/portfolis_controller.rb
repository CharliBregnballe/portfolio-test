class PortfolisController < ApplicationController
  def index
    @portfoli_items = Portfoli.all
  end

end
