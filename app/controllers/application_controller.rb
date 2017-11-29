class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # refactor confirmation of logged_in_user to be used in both users_controller and diets_controller
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
