class RaidersController < ApplicationController
 # belongs_to :team # Foreign key to the raiders team

  def index
    @raiders = Raider.all
  end

  def show
    @raider = Raider.find(params[:id])
  end

  def new
    @raider = Raider.new
  end

  def create
    @raider = Raider.new(raider_params)

    if @raider.save
      redirect_to @raider
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @raider = Raider.find(params[:id])
  end

  def update
    @raider = Raider.find(params[:id])

    if @raider.update(raider_params)
      redirect_to @raider
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @raider = Raider.find(params[:id])
    @raider.destroy

    redirect_to root_path, status: :see_other
  end

  private 
    def raider_params
      params.require(:raider).permit(:name, :active_ind)
    end
end
