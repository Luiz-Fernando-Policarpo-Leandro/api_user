class UsersController < ApplicationController
    before_action :authorization

    def create
        user = User.new(user_params)
        if user.save!
            render json: {"sucess": "usuario criado com sucesso"}
        else
            render json: {"erro": user.errors}
        end
    end

    def show
        id_user = params[:id] || nil
        if id_user
            res = [User.find_by(id: id_user)]
        else
            res = User.all
        end

        render json: res.map {|user| {nome: user.nome, email: user.email} } 
    end

    def update

    end

    private

    def user_params
        params.require(:user).permit(:nome, :email, :password)
    end

end
