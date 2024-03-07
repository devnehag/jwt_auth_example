class UsersController < ApplicationController
    before_action :authorize_request
  
    def show
      render json: { user: @current_user }
    end
  end
