class PortfolisController < ApplicationController
  def index
    @portfoli_items = Portfoli.all
  end

  def new
    @portfoli_item = Portfoli.new
  end

  def create
    @portfoli_item = Portfoli.new(params.require(:portfoli).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfoli_item.save
        format.html { redirect_to portfolis_path, notice: 'portfoli_item was successfully created.' }
        format.json { render :show, status: :created, location: @portfoli_item }
      else
        format.html { render :new }
        format.json { render json: @portfoli_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
