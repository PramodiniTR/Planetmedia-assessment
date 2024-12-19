class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
      
        if user&.valid_password?(params[:password])
          token = generate_jwt(user) # Manually generate JWT token
          render json: { token: token, message: "Login successful" }, status: :ok
        else
          render json: { error: "Invalid credentials" }, status: :unauthorized
        end
      end
      
      private
      
      def generate_jwt(user)
        payload = { sub: user.id, exp: 30.minutes.from_now.to_i }
        JWT.encode(payload, Rails.application.secret_key_base)
      end
end
