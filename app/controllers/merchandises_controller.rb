class MerchandisesController < ApplicationController
  before_action :set_merchandise, only: %i[edit update destroy]
  def index
    @merchandises = Merchandise.all
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = current_user.merchandises.build(params_merchandise)
    if @merchandise.save
      redirect_to merchandises_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @merchandise.update(params_merchandise)
      redirect_to merchandises_path
    else
      render :edit
    end
  end

  def destroy;end

  private

  def set_merchandise
    @merchandise = current_user.merchandises.find(params[:id])
  end

  def params_merchandise
    params.require(:merchandise).permit(:name, :content, :price, :start_at, :end_at)
  end
end
