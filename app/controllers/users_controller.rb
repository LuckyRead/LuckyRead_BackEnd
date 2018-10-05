class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # authenticate_user is now a resource you can use on any method to make sure the client is authorized
  before_action :authenticate_user,  only: [:auth]

  # Public method
  def index
    render json: { service: 'auth-api', status: 200 }
  end
  
  # Authorized only method
  def auth
    render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}" }
  end

  # GET /users
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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
      params.fetch(:user, {})
    end
end
