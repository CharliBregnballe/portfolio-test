class PortfolisController < ApplicationController
  def index
    @portfoli_items = Portfoli.all
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
    @portfoli_item = Portfoli.find(params[:id])
  end

  def update
    @portfoli_item = Portfoli.find(params[:id])

    respond_to do |format|
      if @portfoli_item.update(portfoli_params)
        format.html { redirect_to portfolis_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfoli_item = Portfoli.find(params[:id])
  end

  def destroy
    @portfoli_item = Portfoli.find(params[:id])
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

end
