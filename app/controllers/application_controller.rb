class ApplicationController < ActionController::API

    def authorization
        unless params[:code] == "code"
            render json: {"erro": "precisa do codigo de autorização"} and return
        end
    end
end
