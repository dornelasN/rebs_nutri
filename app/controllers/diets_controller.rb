class DietsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  
  def index
    @diets = Diet.all
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = current_user.diets.build(diet_params)
    if @diet.save
      flash[:success] = "Diet uploaded!"
      redirect_to root_url
    else
      flash[:danger] = "Problem with upload!"
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def diet_params
    params.require(:diet).permit(:picture)
  end
end
