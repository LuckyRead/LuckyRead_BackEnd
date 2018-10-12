class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user,  only: [:current, :email]
  before_action :authenticate_user,  only: [:auth]

  # GET /users
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def signin
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, msg: 'User created'
    else
      render json: {status: :unprocessable_entity, error: user.errors}
    end
  end

  def current
    render json: {current_user: current_user.username}, status: 200
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user].permit(:username, :password, :name, :lastname, :email, :password, :cities_id)
    end
end
