class PortfolisController < ApplicationController
  before_action :set_portolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all


  def index
    @portfoli_items = Portfoli.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfoli.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfoli.angular
  end

  def new
    @portfoli_item = Portfoli.new
    3.times { @portfoli_item.technologies.build }
  end

  def create
    @portfoli_item = Portfoli.new(portfoli_params)

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

  def edit
    3.times { @portfoli_item.technologies.build }
  end

  def update


    respond_to do |format|
      if @portfoli_item.update(portfoli_params)
        format.html { redirect_to portfolis_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show

  end

  def destroy
    @portfoli_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolis_url, notice: 'Portfoli was successfully destroyed.' }
    end
  end


  private

  def portfoli_params
    params.require(:portfoli).permit(:title,
                                     :subtitle,
                                     :body,
                                     technologies_attributes: [:name]
                                    )
  end

  def set_portolio_item
    @portfoli_item = Portfoli.find(params[:id])
  end

end
