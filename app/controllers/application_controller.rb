class ApplicationController < ActionController::API

    def encode_code(payload)
        JWT.encode(payload, ENV["JWT_KEY_SECRET"], "HS256")
    end

    def decode_code
        auth_header = request.headers["Authorization"]
        return nil unless auth_header

        token = auth_header.split(" ").last
        JWT.decode(token, ENV["JWT_KEY_SECRET"], true, algorithm: "HS256")
    rescue JWT::DecodeError, JWT::ExpiredSignature
        nil
    end

    def authorized_user
        decoded_token = decode_code
        return false unless decoded_token

        user_id = decoded_token[0]["user_id"]
        @current_user = User.find_by(id: user_id)
        @current_user.present?
    end

    def authorize
        render json: { message: "Você precisa estar logado" }, status: :unauthorized unless authorized_user
    end
end