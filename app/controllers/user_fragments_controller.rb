class UserFragmentsController < ApplicationController
  before_action :set_user_fragment, only: [:show, :update, :destroy]

  # GET /user_fragments
  def index
    @user_fragments = UserFragment.all

    render json: @user_fragments
  end

  # GET /user_fragments/1
  def show
    render json: @user_fragment
  end

  # POST /user_fragments
  def create
    @user_fragment = UserFragment.new(user_fragment_params)

    if @user_fragment.save
      render json: @user_fragment, status: :created, location: @user_fragment
    else
      render json: @user_fragment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_fragments/1
  def update
    if @user_fragment.update(user_fragment_params)
      render json: @user_fragment
    else
      render json: @user_fragment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_fragments/1
  def destroy
    @user_fragment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_fragment
      @user_fragment = UserFragment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_fragment_params
      params.require(:user_fragment).permit(:iduserfragment, :title, :introduction, :content, :source, :score, :state)
    end
end
