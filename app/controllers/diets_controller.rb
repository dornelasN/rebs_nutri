class DietsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @diet = Diet.new
  end

  def create
    @diet = user.diets.build(diet_params)
    if @diet.save
      flash[:success] = "Diet uploaded!"
      redirect_to user
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
