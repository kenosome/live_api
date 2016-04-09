class UserController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def index
    @users=User.all
  end

  def destroy
    user=User.find(params[:id])

    if user.delete
      render json: {status: "Se eliminó el usuario"}, status: :ok
    else
      render json: {status: "No se pudo eliminar el usuario"}, status: :unprocessable_entity
    end

  end

  #Crear un nuevo usuario
  def create
    user = User.new(user_params)
    if user.save
        render json:{status: "Se creó el usuario."}, status: :ok
    else
        render json: {status: "Error al guardar.", errors: user.errors}, status: :unprocessable_entity
    end
  end
  #Actualizar un usuario
  def update
    user = User.find(params[:id])
    #user.name = params[:name]
    #user.phone = params[:phone]

    if user.update(user_params)
      render json: {status: "Se actualizó el usuario."}, status: :ok
    else
      render json: {status: "Error al actualizar."}, status: :unprocessable_entity
    end

  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end

end
