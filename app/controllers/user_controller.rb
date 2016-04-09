class UserController < ApplicationController

  #Crear un nuevo usuario
  def create
    user = User.new(user_params)
    if user.save
        render json:{status: "Se creó el usuario"}, status: :ok
    else
        render json: {status: "Error al guardar", errors: user.errors}, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end

end
