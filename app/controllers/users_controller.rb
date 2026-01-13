class UsersController < ApplicationController
    before_action :authorize, except: %i[ login create ]

    def login
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            token = encode_code(user_id: user.id)
            render json: {user: user, token: token}, status: :ok
        else
            render json: {erro: "Credenciais invalidas"}, status: :unprocessable_entity
        end
    end

    def index
    end

    def create
        user = User.new(user_params)
        if user.save!
            token = encode_code(user_id: user.id)
            render json: {user: @user ,"token": token}, status: :ok
        else
            render json: {"erro": user.errors}, status: :unprocessable_entity
        end
    end

    def show
        id_user = params[:id] || nil
        if id_user
            res = [User.find_by(id: id_user)]
        else
            res = User.all
        end

        render json: res.map {|user| {nome: user.nome, email: user.email} }, status: :ok
    end

    def update

    end

    private

    def user_params
        params.permit(:nome, :email, :password)
    end

end
