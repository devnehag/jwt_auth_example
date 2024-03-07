class ApplicationController < ActionController::API
   before_action :authorize_request
    private
  def authorize_request
    puts("inside auth request function")
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
      @current_user = User.find(@decoded[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
