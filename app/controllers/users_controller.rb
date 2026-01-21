class UsersController < ApplicationController
  before_action :authorize, except: %i[login create]
  before_action :set_user, only: %i[show update]

  def login
    user = User.find_by(email: user_params[:email])

    if user&.authenticate(user_params[:password])
      token = encode_code(user_id: user.id)
      render json: { user: user, token: token }, status: :ok
    else
      render json: { erro: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  def index
    users = User.all
    render json: users.as_json(only: [:id, :nome, :email]), status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      token = encode_code(user_id: user.id)
      render json: { user: user, token: token }, status: :created
    else
      render json: { erro: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: { nome: @user.nome, email: @user.email }, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: { message: "Usuário atualizado com sucesso", user: @user }, status: :ok
    else
      render json: { erro: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    render json: { erro: "Usuário não encontrado" }, status: :not_found unless @user
  end

  def user_params
    params.permit(:nome, :email, :password)
  end
end
