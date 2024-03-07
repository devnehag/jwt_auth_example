class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
        user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      puts("In session controller - if condition true")
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
      render json: { token: token, user: { id: user.id, username: user.username } }
    else
      puts "Authentication failed for username: #{params[:username]}"
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
  end


