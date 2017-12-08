class DietsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  
  def index
    @diets = Diet.all
  end

  def new
    @diet = Diet.new
  end

  def create
    #TODO: the diet should be saved to the @user on the view and not to the current_user
    # The following commented code is what I thought would work, but the :user_id or :id always return nil
    # so I'm not able to retrieve the user that is showing in the view to post a new pdf file to his 'diet' attribute
    # @user = User.find(params[:user_id]) # or User.find(user_params[:id])
    # @diet = @user.diets.build(diet_params)
    @diet = current_user.diets.build(diet_params)
    # whereas in this code, the pdf diet is posted to the current_user (admin) 
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
